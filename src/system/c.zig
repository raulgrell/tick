use @cImport({
    // C
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
    // Linux
    @cInclude("unistd.h");
    @cInclude("sys/types.h");
    @cInclude("sys/stat.h");
    @cInclude("dlfcn.h");
    // Libs
    @cInclude("png.h");
    @cInclude("epoxy/gl.h");
    @cInclude("GLFW/glfw3.h");
    @cInclude("soundio/soundio.h");
});

// pub fn getFileSize(path: []const u8) -> int64 {
//     ifstream in(path, ifstream::ate | ifstream::binary);
//     return in.tellg();
// }

// pub fn fileExists(path: []const u8) -> bool {
//     if ( FILE *file = fopen(path.c_str(), "r") ) {
//         fclose(file);
//         return true;
//     }
//     else {
//         return false;
//     }
// }

// pub fn readFile(path: []const u8) -> byte* {
//     ifstream ifs(path, ios::binary | ios::ate);
//     ifstream::pos_type pos = ifs.tellg();

//     byte* result = new byte[pos];

//     ifs.seekg(0, ios::beg);
//     ifs.read(reinterpret_cast<char *>(result), pos);

//     return result;
// }

// pub fn readFile(path: []const u8, void* buffer, int64 size) -> bool {
//     ifstream ifs(path, ios::binary | ios::ate);
//     ifstream::pos_type pos = ifs.tellg();

//     byte* result = new byte[pos];

//     ifs.seekg(0, ios::beg);
//     ifs.read(reinterpret_cast<char *>( result ), size == -1 ? int64(pos) : size);

//     return result;
// }

// pub fn readTextFile(path: []const u8) -> String {
//     vector<unsigned char> fileContents = {};

//     ifstream file(path);
//     if ( file.fail() ) {
//         perror(path.c_str());
//         return string("");
//     }

//     size_t fileSize = 0;
//     if ( file.seekg(0, ios::end).good() ) fileSize = (size_t)file.tellg();
//     if ( file.seekg(0, ios::beg).good() ) fileSize -= (size_t)file.tellg();

//     if ( fileSize > 0 ) {
//         fileContents.resize(fileSize);
//         file.read((char*)( &fileContents[0] ), fileSize);
//     }
//     else {
//         fileContents.clear();
//     }

//     file.close();

//     return string(fileContents.begin(), fileContents.end());
// }

// pub fn writeFile(path: []const u8, byte* buffer) -> bool {
//     ofstream file(path, ios::out | ios::binary);
//     file.write(reinterpret_cast<char*>(buffer), sizeof(buffer));
//     return true;
// }

// pub fn writeTextFile(path: []const u8, const String& text) -> bool {
//     ofstream file(path, ios::out | ios::binary);
//     file.write(text.c_str(), text.length());
//     return true;
// }
