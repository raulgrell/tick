pub fn getFileSize(path: []const u8) -> int64 {
	ifstream in(path, ifstream::ate | ifstream::binary);
	return in.tellg();
}

pub fn fileExists(path: []const u8) -> bool {
	if ( FILE *file = fopen(path.c_str(), "r") ) {
		fclose(file);
		return true;
	}
	else {
		return false;
	}
}

pub fn readFile(path: []const u8) -> byte* {
	ifstream ifs(path, ios::binary | ios::ate);
	ifstream::pos_type pos = ifs.tellg();

	byte* result = new byte[pos];

	ifs.seekg(0, ios::beg);
	ifs.read(reinterpret_cast<char *>(result), pos);

	return result;
}

pub fn readFile(path: []const u8, void* buffer, int64 size) -> bool {
	ifstream ifs(path, ios::binary | ios::ate);
	ifstream::pos_type pos = ifs.tellg();

	byte* result = new byte[pos];

	ifs.seekg(0, ios::beg);
	ifs.read(reinterpret_cast<char *>( result ), size == -1 ? int64(pos) : size);

	return result;
}

pub fn readTextFile(path: []const u8) -> String {
	vector<unsigned char> fileContents = {};

	ifstream file(path);
	if ( file.fail() ) {
		perror(path.c_str());
		return string("");
	}

	size_t fileSize = 0;
	if ( file.seekg(0, ios::end).good() ) fileSize = (size_t)file.tellg();
	if ( file.seekg(0, ios::beg).good() ) fileSize -= (size_t)file.tellg();

	if ( fileSize > 0 ) {
		fileContents.resize(fileSize);
		file.read((char*)( &fileContents[0] ), fileSize);
	}
	else {
		fileContents.clear();
	}

	file.close();

	return string(fileContents.begin(), fileContents.end());
}

pub fn writeFile(path: []const u8, byte* buffer) -> bool {
	ofstream file(path, ios::out | ios::binary);
	file.write(reinterpret_cast<char*>(buffer), sizeof(buffer));
	return true;
}

pub fn writeTextFile(path: []const u8, const String& text) -> bool {
	ofstream file(path, ios::out | ios::binary);
	file.write(text.c_str(), text.length());
	return true;
}

const VFS = struct {
	m_MountPoints: Map<String, ArrayList<String>>;

	void init() {
		s_Instance = metanew VFS();
	}

	void Shutdown() {
		metadel s_Instance;
	}
	
	void Mount(const String& virtualPath, const String& physicalPath) {
		m_MountPoints[virtualPath].push_back(physicalPath);
	}

	void Unmount(path: []const u8) {
		m_MountPoints[path].clear();
	}

	bool Resolve(path: []const u8, String& outPhysicalPath) {
		if (path[0] != '/') {
			outPhysicalPath = path;
			return FileSystem::FileExists(path);
		}

		ArrayList(String) dirs = SplitString(path, '/');
		const String& virtualDir = dirs.front();

		if (m_MountPoints.find(virtualDir) == m_MountPoints.end() or m_MountPoints[virtualDir].empty())
			return false;

		String remainder = path.substr(virtualDir.size() + 1, path.size() - virtualDir.size());
		for (const String& physicalPath : m_MountPoints[virtualDir]) {
			String path = physicalPath + remainder;
			if (FileSystem::FileExists(path)) {
				outPhysicalPath = path;
				return true;
			}
		}
		return false;
	}

	byte* ReadFile(path: []const u8) {		
		String physicalPath;
		return Resolve(path, physicalPath) ? FileSystem::ReadFile(physicalPath) : nullptr;
	}

	String ReadTextFile(path: []const u8) {
		return Resolve(path, physicalPath) ? FileSystem::ReadTextFile(physicalPath) : nullptr;
	}

	bool WriteFile(path: []const u8, byte* buffer) {
		return Resolve(path, physicalPath) ? FileSystem::WriteFile(physicalPath, buffer) : false;
	}

	bool WriteTextFile(path: []const u8, const String& text) {
		return Resolve(path, physicalPath) ? FileSystem::WriteTextFile(physicalPath, text) : false;
	}
}