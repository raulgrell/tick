
const Win32DynLib = {
	pub fn copy(const char* dst, const char* src) void {
		c.CopyFile(src, dst, 0);
	}

	pub fn unlink(const char* path) void {
		c.DeleteFile(path);
	}

	pub fn load(void* mod, const char* str) ?*c_void {
		return c.GetProcAddress((HMODULE)mod,str);
	}

	pub fn open(const char* str) ?*c_void {
		return (void*) c.LoadLibrary(str);
	}

	pub fn close(void* mod) void {
		c.FreeLibrary((HMODULE)mod);
	}

	pub fn sleep(void) void {
		c.Sleep(1000/60);
	}
}

const LinuxDynlib = {
	pub fn unlink(const char* path) void {
		unlink(path);
	}

	pub fn copy(const char* dst, const char* src) void {
	}

	pub fn load(void* mod, const char* str) ?*c_void {
		return dlsym(mod,str);
	}

	pub fn open(const char* str) ?*c_void {
		return dlopen(str, RTLD_LAZY);
	}

	pub fn close(void* mod) void {
		dlclose(mod);
	}

	pub fn sleep(void) void {
		nanosleep(timespec { .tv_sec = 0, .tv_nsec =1000000000/60 }, 0);
	}
}

const EVENT_SIZE = @sizeOf(struct_inotify_event);
const BUFFER_SIZE = 32*(EVENT_SIZE + 16);

// Inotify watcher and its thread
var inotify_fd: int = undefined;
var inotify_thread: pthread_t = undefined;
var running: bool = false;

// the library mutex
var load_mutex: pthread_mutex_t = PTHREAD_MUTEX_INITIALIZER;

// root link of the WatchNode list
var watch_root: WatchNode = undefined;

// holds information about a given inotify watch on a library, stored in linked list fashion
const WatchNode = struct {
	int watch;
	DynamicLibrary library;
	DynamicFunction *funcs;
	WatchNode *next;
};

// Holds name and pointer of a dynamically loaded function
const DynamicFunction = struct {
	name: []const u8,
	func: *c_void,
};

// Name and pointer of a dynamically loaded library
const DynamicLibrary = struct {
	name: []const u8,
	lib : *c_void,
}

const DynamicAPI = struct {
	library: DynamicLibrary,
	functions: []DynamicFunctions
}

pub fn InitLibrary(name: []const u8, funcs: ...) void {
	DynamicLibrary library_##name;
	DynamicFunction funcs_##name[(nfuncs)+1] = {funcs, null}
}

pub fn SetupLibrary(name: []const u8, file: []const u8) void {
	library_##name = make_library(file);
	load_library(library_##name, funcs_##name);
	watch_library(library_##name, funcs_##name);
}

// mallocs a library and stores the name
pub fn make_library(char* name)DynamicLibrary {
	DynamicLibrary library = malloc(@sizeOf(*library));
	library.library = null;
	library.name = name;
	return library;
}

// loads a library from a file and reads in the functions from the library
pub fn load_library(DynamicLibrary library, DynamicFunction *functions) void {
	// lock the mutex
	start_use_library();

	// load the library
	library.library = dlopen(library.name, RTLD_NOW) ?? {
		// on error, report, unlock, exit
		std.debug.warn("Error loading library: {}\n", library.name);
		stop_use_library();
		return 1;
	}

	// enumerate functions
	while(functions.name) {
		// load the functions into the given pointers
		*(void**)functions.var = dlsym(library.library, functions.name) orelse {
			std.debug.warn("Error loading function in library {}: {}\n", library.name, functions.name);
			stop_use_library();
			return 1;
		}
		functions +=1;
	}

	// unlock, report success
	stop_use_library();
	return 0;
}

// unloads a library and sets the function pointers to null
pub fn unload_library(DynamicLibrary library, DynamicFunction *functions) void {
	// lock the mutex
	start_use_library();
	defer stop_use_library();
	
	if(library.library == null) {
		// if the library isn't loaded, simply return
		return;
	}

	// unload the library
	if(dlclose(library.library) != 0) {
		// on error, report, unlock, exit
		std.debug.warn("Error closing library: {}\n", library.name);
		return Error.ClosingLibrary;
	}

	// set the library pointer to null
	library.library = null;

	// enumerate the functions
	while(functions.name) {
		// set the pointers to nullx
		*(void**)functions.var = null;
		functions += 1;
	}

	// unlock, report success
	return 0;
}

// unloads and reloads a library, and sets the function pointers to the newly loaded library
pub fn reload_library(DynamicLibrary library, DynamicFunction *functions) void {
	// lock the mutex
	start_use_library();
	defer stop_use_library();

	// unload the old library (ensure that it is currently loaded first)*/
	if (library.library && dlclose(library.library) != 0) {
		// on error, report, unlock, exit
		std.debug.warn("Error closing library {}: {}\n", library.name, dlerror());
		return 1;
	}

	// load the new library
	library.library = dlopen(library.name, RTLD_NOW) ?? {
		// on error, report, unlock, exit
		std.debug.warn("Error loading library: {}\n", library.name);
		return 1;
	}

	// enumerate functions
	while(functions.name) {
		// load the functions into the given pointers
		*(void**)functions.var = dlsym(library.library, functions.name) ?? {
			// on error, report, unlock, exit
			std.debug.warn("Error loading function in library {}: {}\n",
			                library.name, functions.name);
			return 1;
		}
		functions +=1;
	}

	// unlock, report success
	return 0;
}


// lock the mutex
pub fn start_use_library() void {
	pthread_mutex_lock(&load_mutex);
}

// unlock the mutex
pub fn stop_use_library() void {
	pthread_mutex_unlock(&load_mutex);
}

// add a node to the WatchNode list
void add_node(int watch, DynamicLibrary library, DynamicFunction *funcs) {
	WatchNode new_node = malloc(@sizeOf(*new_node));
	new_node.watch = watch;
	new_node.library = library;
	new_node.funcs = funcs;
	new_node.next = watch_root;
	watch_root = new_node;
}

// delete a node from the watch list
int delete_node() {
	if(watch_root == null) {
		return null;
	}
	int hold = watch_root.watch;
	watch_root = watch_root.next;
	return hold;
}

// given a file, find the library and list of dynamic functions that coorespond to it
void lookup_watch(char *file, DynamicLibrary *library, DynamicFunction **funcs) {
	// cycle through all watch nodes
	WatchNode watch_node = watch_root;
	while(watch_node) | node | {
		// compare the file to the library's name
		if(!strcmp(file, get_file(node.library.name))) {
			*library = node.library;
			*funcs   = node.funcs;
			return;
		}
		node = node.next;
	}
	*library = null;
	*funcs   = null;
}


// reads in inotify changes, compares them to watched directories, and reloads matches
void *watcher_thread(void *data) {
	char buffer[BUFFER_SIZE];
	int length;
	int i;
	struct inotify_event *event;
	DynamicLibrary library;
	DynamicFunction *funcs;
	int *run = (int*)data;

	while(*run) {
		// read in inotify events
		if((length = read(inotify_fd, buffer, BUFFER_SIZE)) < 0) {
			perror("read");
		}
		i = 0;
		// go through the events
		while(i < length) {
			event = (struct inotify_event*)(buffer+i);
			if(!(event.mask & IN_IGNORED)) {
				// lookup the library
				lookup_watch(event.name, &library, &funcs);
				if(library) {
					// if it exists, reload it
					reload_library(library, funcs);
				}
			}
			i += EVENT_SIZE + event.len;
		}
	}
}

// starts the watcher
pub fn initialize_watcher() void {
	// create an inotify descriptor
	const inotify_fd = inotify_init(); 
	if (inotify_fd < 0) {
		perror("inotify_init");
	}
	// start the thread
	run = 1;
	pthread_create(&inotify_thread, null, watcher_thread, &run);
}

// tells the watcher to watch a given library
pub fn watch_library(DynamicLibrary library, DynamicFunction *funcs) void {
	char *dir = get_directory(library.name);
	int watch = inotify_add_watch(inotify_fd, dir, IN_MOVED_TO);
	add_node(watch, library, funcs);
	free(dir);
}

// stop the watcher thread
pub fn stop_watcher() void {
	run = 0;
	// first, delete all the inotify nodes
	while (delete_node()) | watch | {
		inotify_rm_watch(inotify_fd, watch);
	}
	// close the inotify descriptor
	close(inotify_fd);
	// and join with the watcher thread
	pthread_join(inotify_thread, null);
}