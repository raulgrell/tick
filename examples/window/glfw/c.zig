// Loader
pub const LoadFn = extern fn(proc_name: ?[*]const u8) ?extern fn() void;
pub extern fn loadGL(load_fn: LoadFn) void {
    loadGL_1_0(load_fn);
    loadGL_1_1(load_fn);
    loadGL_1_2(load_fn);
    loadGL_1_3(load_fn);
    loadGL_1_4(load_fn);
    loadGL_1_5(load_fn);
    loadGL_2_0(load_fn);
    loadGL_2_1(load_fn);
    loadGL_3_0(load_fn);
    loadGL_3_1(load_fn);
    loadGL_3_2(load_fn);
    loadGL_3_3(load_fn);
}

pub extern fn loadGL_1_0(load_fn: LoadFn) void {
    glad_glCullFace = @ptrCast(PFNGLCULLFACEPROC, load_fn(c"glCullFace"));
    glad_glFrontFace = @ptrCast(PFNGLFRONTFACEPROC, load_fn(c"glFrontFace"));
    glad_glHint = @ptrCast(PFNGLHINTPROC, load_fn(c"glHint"));
    glad_glLineWidth = @ptrCast(PFNGLLINEWIDTHPROC, load_fn(c"glLineWidth"));
    glad_glPointSize = @ptrCast(PFNGLPOINTSIZEPROC, load_fn(c"glPointSize"));
    glad_glPolygonMode = @ptrCast(PFNGLPOLYGONMODEPROC, load_fn(c"glPolygonMode"));
    glad_glScissor = @ptrCast(PFNGLSCISSORPROC, load_fn(c"glScissor"));
    glad_glTexParameterf = @ptrCast(PFNGLTEXPARAMETERFPROC, load_fn(c"glTexParameterf"));
    glad_glTexParameterfv = @ptrCast(PFNGLTEXPARAMETERFVPROC, load_fn(c"glTexParameterfv"));
    glad_glTexParameteri = @ptrCast(PFNGLTEXPARAMETERIPROC, load_fn(c"glTexParameteri"));
    glad_glTexParameteriv = @ptrCast(PFNGLTEXPARAMETERIVPROC, load_fn(c"glTexParameteriv"));
    glad_glTexImage1D = @ptrCast(PFNGLTEXIMAGE1DPROC, load_fn(c"glTexImage1D"));
    glad_glTexImage2D = @ptrCast(PFNGLTEXIMAGE2DPROC, load_fn(c"glTexImage2D"));
    glad_glDrawBuffer = @ptrCast(PFNGLDRAWBUFFERPROC, load_fn(c"glDrawBuffer"));
    glad_glClear = @ptrCast(PFNGLCLEARPROC, load_fn(c"glClear"));
    glad_glClearColor = @ptrCast(PFNGLCLEARCOLORPROC, load_fn(c"glClearColor"));
    glad_glClearStencil = @ptrCast(PFNGLCLEARSTENCILPROC, load_fn(c"glClearStencil"));
    glad_glClearDepth = @ptrCast(PFNGLCLEARDEPTHPROC, load_fn(c"glClearDepth"));
    glad_glStencilMask = @ptrCast(PFNGLSTENCILMASKPROC, load_fn(c"glStencilMask"));
    glad_glColorMask = @ptrCast(PFNGLCOLORMASKPROC, load_fn(c"glColorMask"));
    glad_glDepthMask = @ptrCast(PFNGLDEPTHMASKPROC, load_fn(c"glDepthMask"));
    glad_glDisable = @ptrCast(PFNGLDISABLEPROC, load_fn(c"glDisable"));
    glad_glEnable = @ptrCast(PFNGLENABLEPROC, load_fn(c"glEnable"));
    glad_glFinish = @ptrCast(PFNGLFINISHPROC, load_fn(c"glFinish"));
    glad_glFlush = @ptrCast(PFNGLFLUSHPROC, load_fn(c"glFlush"));
    glad_glBlendFunc = @ptrCast(PFNGLBLENDFUNCPROC, load_fn(c"glBlendFunc"));
    glad_glLogicOp = @ptrCast(PFNGLLOGICOPPROC, load_fn(c"glLogicOp"));
    glad_glStencilFunc = @ptrCast(PFNGLSTENCILFUNCPROC, load_fn(c"glStencilFunc"));
    glad_glStencilOp = @ptrCast(PFNGLSTENCILOPPROC, load_fn(c"glStencilOp"));
    glad_glDepthFunc = @ptrCast(PFNGLDEPTHFUNCPROC, load_fn(c"glDepthFunc"));
    glad_glPixelStoref = @ptrCast(PFNGLPIXELSTOREFPROC, load_fn(c"glPixelStoref"));
    glad_glPixelStorei = @ptrCast(PFNGLPIXELSTOREIPROC, load_fn(c"glPixelStorei"));
    glad_glReadBuffer = @ptrCast(PFNGLREADBUFFERPROC, load_fn(c"glReadBuffer"));
    glad_glReadPixels = @ptrCast(PFNGLREADPIXELSPROC, load_fn(c"glReadPixels"));
    glad_glGetBooleanv = @ptrCast(PFNGLGETBOOLEANVPROC, load_fn(c"glGetBooleanv"));
    glad_glGetDoublev = @ptrCast(PFNGLGETDOUBLEVPROC, load_fn(c"glGetDoublev"));
    glad_glGetError = @ptrCast(PFNGLGETERRORPROC, load_fn(c"glGetError"));
    glad_glGetFloatv = @ptrCast(PFNGLGETFLOATVPROC, load_fn(c"glGetFloatv"));
    glad_glGetIntegerv = @ptrCast(PFNGLGETINTEGERVPROC, load_fn(c"glGetIntegerv"));
    glad_glGetString = @ptrCast(PFNGLGETSTRINGPROC, load_fn(c"glGetString"));
    glad_glGetTexImage = @ptrCast(PFNGLGETTEXIMAGEPROC, load_fn(c"glGetTexImage"));
    glad_glGetTexParameterfv = @ptrCast(PFNGLGETTEXPARAMETERFVPROC, load_fn(c"glGetTexParameterfv"));
    glad_glGetTexParameteriv = @ptrCast(PFNGLGETTEXPARAMETERIVPROC, load_fn(c"glGetTexParameteriv"));
    glad_glGetTexLevelParameterfv = @ptrCast(PFNGLGETTEXLEVELPARAMETERFVPROC, load_fn(c"glGetTexLevelParameterfv"));
    glad_glGetTexLevelParameteriv = @ptrCast(PFNGLGETTEXLEVELPARAMETERIVPROC, load_fn(c"glGetTexLevelParameteriv"));
    glad_glIsEnabled = @ptrCast(PFNGLISENABLEDPROC, load_fn(c"glIsEnabled"));
    glad_glDepthRange = @ptrCast(PFNGLDEPTHRANGEPROC, load_fn(c"glDepthRange"));
    glad_glViewport = @ptrCast(PFNGLVIEWPORTPROC, load_fn(c"glViewport"));
}
pub extern fn loadGL_1_1(load_fn: LoadFn) void {
    glad_glDrawArrays = @ptrCast(PFNGLDRAWARRAYSPROC, load_fn(c"glDrawArrays"));
    glad_glDrawElements = @ptrCast(PFNGLDRAWELEMENTSPROC, load_fn(c"glDrawElements"));
    glad_glPolygonOffset = @ptrCast(PFNGLPOLYGONOFFSETPROC, load_fn(c"glPolygonOffset"));
    glad_glCopyTexImage1D = @ptrCast(PFNGLCOPYTEXIMAGE1DPROC, load_fn(c"glCopyTexImage1D"));
    glad_glCopyTexImage2D = @ptrCast(PFNGLCOPYTEXIMAGE2DPROC, load_fn(c"glCopyTexImage2D"));
    glad_glCopyTexSubImage1D = @ptrCast(PFNGLCOPYTEXSUBIMAGE1DPROC, load_fn(c"glCopyTexSubImage1D"));
    glad_glCopyTexSubImage2D = @ptrCast(PFNGLCOPYTEXSUBIMAGE2DPROC, load_fn(c"glCopyTexSubImage2D"));
    glad_glTexSubImage1D = @ptrCast(PFNGLTEXSUBIMAGE1DPROC, load_fn(c"glTexSubImage1D"));
    glad_glTexSubImage2D = @ptrCast(PFNGLTEXSUBIMAGE2DPROC, load_fn(c"glTexSubImage2D"));
    glad_glBindTexture = @ptrCast(PFNGLBINDTEXTUREPROC, load_fn(c"glBindTexture"));
    glad_glDeleteTextures = @ptrCast(PFNGLDELETETEXTURESPROC, load_fn(c"glDeleteTextures"));
    glad_glGenTextures = @ptrCast(PFNGLGENTEXTURESPROC, load_fn(c"glGenTextures"));
    glad_glIsTexture = @ptrCast(PFNGLISTEXTUREPROC, load_fn(c"glIsTexture"));
}
pub extern fn loadGL_1_2(load_fn: LoadFn) void {
    glad_glDrawRangeElements = @ptrCast(PFNGLDRAWRANGEELEMENTSPROC, load_fn(c"glDrawRangeElements"));
    glad_glTexImage3D = @ptrCast(PFNGLTEXIMAGE3DPROC, load_fn(c"glTexImage3D"));
    glad_glTexSubImage3D = @ptrCast(PFNGLTEXSUBIMAGE3DPROC, load_fn(c"glTexSubImage3D"));
    glad_glCopyTexSubImage3D = @ptrCast(PFNGLCOPYTEXSUBIMAGE3DPROC, load_fn(c"glCopyTexSubImage3D"));
}
pub extern fn loadGL_1_3(load_fn: LoadFn) void {
    glad_glActiveTexture = @ptrCast(PFNGLACTIVETEXTUREPROC, load_fn(c"glActiveTexture"));
    glad_glSampleCoverage = @ptrCast(PFNGLSAMPLECOVERAGEPROC, load_fn(c"glSampleCoverage"));
    glad_glCompressedTexImage3D = @ptrCast(PFNGLCOMPRESSEDTEXIMAGE3DPROC, load_fn(c"glCompressedTexImage3D"));
    glad_glCompressedTexImage2D = @ptrCast(PFNGLCOMPRESSEDTEXIMAGE2DPROC, load_fn(c"glCompressedTexImage2D"));
    glad_glCompressedTexImage1D = @ptrCast(PFNGLCOMPRESSEDTEXIMAGE1DPROC, load_fn(c"glCompressedTexImage1D"));
    glad_glCompressedTexSubImage3D = @ptrCast(PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC, load_fn(c"glCompressedTexSubImage3D"));
    glad_glCompressedTexSubImage2D = @ptrCast(PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC, load_fn(c"glCompressedTexSubImage2D"));
    glad_glCompressedTexSubImage1D = @ptrCast(PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC, load_fn(c"glCompressedTexSubImage1D"));
    glad_glGetCompressedTexImage = @ptrCast(PFNGLGETCOMPRESSEDTEXIMAGEPROC, load_fn(c"glGetCompressedTexImage"));
}
pub extern fn loadGL_1_4(load_fn: LoadFn) void {
    glad_glBlendFuncSeparate = @ptrCast(PFNGLBLENDFUNCSEPARATEPROC, load_fn(c"glBlendFuncSeparate"));
    glad_glMultiDrawArrays = @ptrCast(PFNGLMULTIDRAWARRAYSPROC, load_fn(c"glMultiDrawArrays"));
    glad_glMultiDrawElements = @ptrCast(PFNGLMULTIDRAWELEMENTSPROC, load_fn(c"glMultiDrawElements"));
    glad_glPointParameterf = @ptrCast(PFNGLPOINTPARAMETERFPROC, load_fn(c"glPointParameterf"));
    glad_glPointParameterfv = @ptrCast(PFNGLPOINTPARAMETERFVPROC, load_fn(c"glPointParameterfv"));
    glad_glPointParameteri = @ptrCast(PFNGLPOINTPARAMETERIPROC, load_fn(c"glPointParameteri"));
    glad_glPointParameteriv = @ptrCast(PFNGLPOINTPARAMETERIVPROC, load_fn(c"glPointParameteriv"));
    glad_glBlendColor = @ptrCast(PFNGLBLENDCOLORPROC, load_fn(c"glBlendColor"));
    glad_glBlendEquation = @ptrCast(PFNGLBLENDEQUATIONPROC, load_fn(c"glBlendEquation"));
}
pub extern fn loadGL_1_5(load_fn: LoadFn) void {
    glad_glGenQueries = @ptrCast(PFNGLGENQUERIESPROC, load_fn(c"glGenQueries"));
    glad_glDeleteQueries = @ptrCast(PFNGLDELETEQUERIESPROC, load_fn(c"glDeleteQueries"));
    glad_glIsQuery = @ptrCast(PFNGLISQUERYPROC, load_fn(c"glIsQuery"));
    glad_glBeginQuery = @ptrCast(PFNGLBEGINQUERYPROC, load_fn(c"glBeginQuery"));
    glad_glEndQuery = @ptrCast(PFNGLENDQUERYPROC, load_fn(c"glEndQuery"));
    glad_glGetQueryiv = @ptrCast(PFNGLGETQUERYIVPROC, load_fn(c"glGetQueryiv"));
    glad_glGetQueryObjectiv = @ptrCast(PFNGLGETQUERYOBJECTIVPROC, load_fn(c"glGetQueryObjectiv"));
    glad_glGetQueryObjectuiv = @ptrCast(PFNGLGETQUERYOBJECTUIVPROC, load_fn(c"glGetQueryObjectuiv"));
    glad_glBindBuffer = @ptrCast(PFNGLBINDBUFFERPROC, load_fn(c"glBindBuffer"));
    glad_glDeleteBuffers = @ptrCast(PFNGLDELETEBUFFERSPROC, load_fn(c"glDeleteBuffers"));
    glad_glGenBuffers = @ptrCast(PFNGLGENBUFFERSPROC, load_fn(c"glGenBuffers"));
    glad_glIsBuffer = @ptrCast(PFNGLISBUFFERPROC, load_fn(c"glIsBuffer"));
    glad_glBufferData = @ptrCast(PFNGLBUFFERDATAPROC, load_fn(c"glBufferData"));
    glad_glBufferSubData = @ptrCast(PFNGLBUFFERSUBDATAPROC, load_fn(c"glBufferSubData"));
    glad_glGetBufferSubData = @ptrCast(PFNGLGETBUFFERSUBDATAPROC, load_fn(c"glGetBufferSubData"));
    glad_glMapBuffer = @ptrCast(PFNGLMAPBUFFERPROC, load_fn(c"glMapBuffer"));
    glad_glUnmapBuffer = @ptrCast(PFNGLUNMAPBUFFERPROC, load_fn(c"glUnmapBuffer"));
    glad_glGetBufferParameteriv = @ptrCast(PFNGLGETBUFFERPARAMETERIVPROC, load_fn(c"glGetBufferParameteriv"));
    glad_glGetBufferPointerv = @ptrCast(PFNGLGETBUFFERPOINTERVPROC, load_fn(c"glGetBufferPointerv"));
}
pub extern fn loadGL_2_0(load_fn: LoadFn) void {
    glad_glBlendEquationSeparate = @ptrCast(PFNGLBLENDEQUATIONSEPARATEPROC, load_fn(c"glBlendEquationSeparate"));
    glad_glDrawBuffers = @ptrCast(PFNGLDRAWBUFFERSPROC, load_fn(c"glDrawBuffers"));
    glad_glStencilOpSeparate = @ptrCast(PFNGLSTENCILOPSEPARATEPROC, load_fn(c"glStencilOpSeparate"));
    glad_glStencilFuncSeparate = @ptrCast(PFNGLSTENCILFUNCSEPARATEPROC, load_fn(c"glStencilFuncSeparate"));
    glad_glStencilMaskSeparate = @ptrCast(PFNGLSTENCILMASKSEPARATEPROC, load_fn(c"glStencilMaskSeparate"));
    glad_glAttachShader = @ptrCast(PFNGLATTACHSHADERPROC, load_fn(c"glAttachShader"));
    glad_glBindAttribLocation = @ptrCast(PFNGLBINDATTRIBLOCATIONPROC, load_fn(c"glBindAttribLocation"));
    glad_glCompileShader = @ptrCast(PFNGLCOMPILESHADERPROC, load_fn(c"glCompileShader"));
    glad_glCreateProgram = @ptrCast(PFNGLCREATEPROGRAMPROC, load_fn(c"glCreateProgram"));
    glad_glCreateShader = @ptrCast(PFNGLCREATESHADERPROC, load_fn(c"glCreateShader"));
    glad_glDeleteProgram = @ptrCast(PFNGLDELETEPROGRAMPROC, load_fn(c"glDeleteProgram"));
    glad_glDeleteShader = @ptrCast(PFNGLDELETESHADERPROC, load_fn(c"glDeleteShader"));
    glad_glDetachShader = @ptrCast(PFNGLDETACHSHADERPROC, load_fn(c"glDetachShader"));
    glad_glDisableVertexAttribArray = @ptrCast(PFNGLDISABLEVERTEXATTRIBARRAYPROC, load_fn(c"glDisableVertexAttribArray"));
    glad_glEnableVertexAttribArray = @ptrCast(PFNGLENABLEVERTEXATTRIBARRAYPROC, load_fn(c"glEnableVertexAttribArray"));
    glad_glGetActiveAttrib = @ptrCast(PFNGLGETACTIVEATTRIBPROC, load_fn(c"glGetActiveAttrib"));
    glad_glGetActiveUniform = @ptrCast(PFNGLGETACTIVEUNIFORMPROC, load_fn(c"glGetActiveUniform"));
    glad_glGetAttachedShaders = @ptrCast(PFNGLGETATTACHEDSHADERSPROC, load_fn(c"glGetAttachedShaders"));
    glad_glGetAttribLocation = @ptrCast(PFNGLGETATTRIBLOCATIONPROC, load_fn(c"glGetAttribLocation"));
    glad_glGetProgramiv = @ptrCast(PFNGLGETPROGRAMIVPROC, load_fn(c"glGetProgramiv"));
    glad_glGetProgramInfoLog = @ptrCast(PFNGLGETPROGRAMINFOLOGPROC, load_fn(c"glGetProgramInfoLog"));
    glad_glGetShaderiv = @ptrCast(PFNGLGETSHADERIVPROC, load_fn(c"glGetShaderiv"));
    glad_glGetShaderInfoLog = @ptrCast(PFNGLGETSHADERINFOLOGPROC, load_fn(c"glGetShaderInfoLog"));
    glad_glGetShaderSource = @ptrCast(PFNGLGETSHADERSOURCEPROC, load_fn(c"glGetShaderSource"));
    glad_glGetUniformLocation = @ptrCast(PFNGLGETUNIFORMLOCATIONPROC, load_fn(c"glGetUniformLocation"));
    glad_glGetUniformfv = @ptrCast(PFNGLGETUNIFORMFVPROC, load_fn(c"glGetUniformfv"));
    glad_glGetUniformiv = @ptrCast(PFNGLGETUNIFORMIVPROC, load_fn(c"glGetUniformiv"));
    glad_glGetVertexAttribdv = @ptrCast(PFNGLGETVERTEXATTRIBDVPROC, load_fn(c"glGetVertexAttribdv"));
    glad_glGetVertexAttribfv = @ptrCast(PFNGLGETVERTEXATTRIBFVPROC, load_fn(c"glGetVertexAttribfv"));
    glad_glGetVertexAttribiv = @ptrCast(PFNGLGETVERTEXATTRIBIVPROC, load_fn(c"glGetVertexAttribiv"));
    glad_glGetVertexAttribPointerv = @ptrCast(PFNGLGETVERTEXATTRIBPOINTERVPROC, load_fn(c"glGetVertexAttribPointerv"));
    glad_glIsProgram = @ptrCast(PFNGLISPROGRAMPROC, load_fn(c"glIsProgram"));
    glad_glIsShader = @ptrCast(PFNGLISSHADERPROC, load_fn(c"glIsShader"));
    glad_glLinkProgram = @ptrCast(PFNGLLINKPROGRAMPROC, load_fn(c"glLinkProgram"));
    glad_glShaderSource = @ptrCast(PFNGLSHADERSOURCEPROC, load_fn(c"glShaderSource"));
    glad_glUseProgram = @ptrCast(PFNGLUSEPROGRAMPROC, load_fn(c"glUseProgram"));
    glad_glUniform1f = @ptrCast(PFNGLUNIFORM1FPROC, load_fn(c"glUniform1f"));
    glad_glUniform2f = @ptrCast(PFNGLUNIFORM2FPROC, load_fn(c"glUniform2f"));
    glad_glUniform3f = @ptrCast(PFNGLUNIFORM3FPROC, load_fn(c"glUniform3f"));
    glad_glUniform4f = @ptrCast(PFNGLUNIFORM4FPROC, load_fn(c"glUniform4f"));
    glad_glUniform1i = @ptrCast(PFNGLUNIFORM1IPROC, load_fn(c"glUniform1i"));
    glad_glUniform2i = @ptrCast(PFNGLUNIFORM2IPROC, load_fn(c"glUniform2i"));
    glad_glUniform3i = @ptrCast(PFNGLUNIFORM3IPROC, load_fn(c"glUniform3i"));
    glad_glUniform4i = @ptrCast(PFNGLUNIFORM4IPROC, load_fn(c"glUniform4i"));
    glad_glUniform1fv = @ptrCast(PFNGLUNIFORM1FVPROC, load_fn(c"glUniform1fv"));
    glad_glUniform2fv = @ptrCast(PFNGLUNIFORM2FVPROC, load_fn(c"glUniform2fv"));
    glad_glUniform3fv = @ptrCast(PFNGLUNIFORM3FVPROC, load_fn(c"glUniform3fv"));
    glad_glUniform4fv = @ptrCast(PFNGLUNIFORM4FVPROC, load_fn(c"glUniform4fv"));
    glad_glUniform1iv = @ptrCast(PFNGLUNIFORM1IVPROC, load_fn(c"glUniform1iv"));
    glad_glUniform2iv = @ptrCast(PFNGLUNIFORM2IVPROC, load_fn(c"glUniform2iv"));
    glad_glUniform3iv = @ptrCast(PFNGLUNIFORM3IVPROC, load_fn(c"glUniform3iv"));
    glad_glUniform4iv = @ptrCast(PFNGLUNIFORM4IVPROC, load_fn(c"glUniform4iv"));
    glad_glUniformMatrix2fv = @ptrCast(PFNGLUNIFORMMATRIX2FVPROC, load_fn(c"glUniformMatrix2fv"));
    glad_glUniformMatrix3fv = @ptrCast(PFNGLUNIFORMMATRIX3FVPROC, load_fn(c"glUniformMatrix3fv"));
    glad_glUniformMatrix4fv = @ptrCast(PFNGLUNIFORMMATRIX4FVPROC, load_fn(c"glUniformMatrix4fv"));
    glad_glValidateProgram = @ptrCast(PFNGLVALIDATEPROGRAMPROC, load_fn(c"glValidateProgram"));
    glad_glVertexAttrib1d = @ptrCast(PFNGLVERTEXATTRIB1DPROC, load_fn(c"glVertexAttrib1d"));
    glad_glVertexAttrib1dv = @ptrCast(PFNGLVERTEXATTRIB1DVPROC, load_fn(c"glVertexAttrib1dv"));
    glad_glVertexAttrib1f = @ptrCast(PFNGLVERTEXATTRIB1FPROC, load_fn(c"glVertexAttrib1f"));
    glad_glVertexAttrib1fv = @ptrCast(PFNGLVERTEXATTRIB1FVPROC, load_fn(c"glVertexAttrib1fv"));
    glad_glVertexAttrib1s = @ptrCast(PFNGLVERTEXATTRIB1SPROC, load_fn(c"glVertexAttrib1s"));
    glad_glVertexAttrib1sv = @ptrCast(PFNGLVERTEXATTRIB1SVPROC, load_fn(c"glVertexAttrib1sv"));
    glad_glVertexAttrib2d = @ptrCast(PFNGLVERTEXATTRIB2DPROC, load_fn(c"glVertexAttrib2d"));
    glad_glVertexAttrib2dv = @ptrCast(PFNGLVERTEXATTRIB2DVPROC, load_fn(c"glVertexAttrib2dv"));
    glad_glVertexAttrib2f = @ptrCast(PFNGLVERTEXATTRIB2FPROC, load_fn(c"glVertexAttrib2f"));
    glad_glVertexAttrib2fv = @ptrCast(PFNGLVERTEXATTRIB2FVPROC, load_fn(c"glVertexAttrib2fv"));
    glad_glVertexAttrib2s = @ptrCast(PFNGLVERTEXATTRIB2SPROC, load_fn(c"glVertexAttrib2s"));
    glad_glVertexAttrib2sv = @ptrCast(PFNGLVERTEXATTRIB2SVPROC, load_fn(c"glVertexAttrib2sv"));
    glad_glVertexAttrib3d = @ptrCast(PFNGLVERTEXATTRIB3DPROC, load_fn(c"glVertexAttrib3d"));
    glad_glVertexAttrib3dv = @ptrCast(PFNGLVERTEXATTRIB3DVPROC, load_fn(c"glVertexAttrib3dv"));
    glad_glVertexAttrib3f = @ptrCast(PFNGLVERTEXATTRIB3FPROC, load_fn(c"glVertexAttrib3f"));
    glad_glVertexAttrib3fv = @ptrCast(PFNGLVERTEXATTRIB3FVPROC, load_fn(c"glVertexAttrib3fv"));
    glad_glVertexAttrib3s = @ptrCast(PFNGLVERTEXATTRIB3SPROC, load_fn(c"glVertexAttrib3s"));
    glad_glVertexAttrib3sv = @ptrCast(PFNGLVERTEXATTRIB3SVPROC, load_fn(c"glVertexAttrib3sv"));
    glad_glVertexAttrib4Nbv = @ptrCast(PFNGLVERTEXATTRIB4NBVPROC, load_fn(c"glVertexAttrib4Nbv"));
    glad_glVertexAttrib4Niv = @ptrCast(PFNGLVERTEXATTRIB4NIVPROC, load_fn(c"glVertexAttrib4Niv"));
    glad_glVertexAttrib4Nsv = @ptrCast(PFNGLVERTEXATTRIB4NSVPROC, load_fn(c"glVertexAttrib4Nsv"));
    glad_glVertexAttrib4Nub = @ptrCast(PFNGLVERTEXATTRIB4NUBPROC, load_fn(c"glVertexAttrib4Nub"));
    glad_glVertexAttrib4Nubv = @ptrCast(PFNGLVERTEXATTRIB4NUBVPROC, load_fn(c"glVertexAttrib4Nubv"));
    glad_glVertexAttrib4Nuiv = @ptrCast(PFNGLVERTEXATTRIB4NUIVPROC, load_fn(c"glVertexAttrib4Nuiv"));
    glad_glVertexAttrib4Nusv = @ptrCast(PFNGLVERTEXATTRIB4NUSVPROC, load_fn(c"glVertexAttrib4Nusv"));
    glad_glVertexAttrib4bv = @ptrCast(PFNGLVERTEXATTRIB4BVPROC, load_fn(c"glVertexAttrib4bv"));
    glad_glVertexAttrib4d = @ptrCast(PFNGLVERTEXATTRIB4DPROC, load_fn(c"glVertexAttrib4d"));
    glad_glVertexAttrib4dv = @ptrCast(PFNGLVERTEXATTRIB4DVPROC, load_fn(c"glVertexAttrib4dv"));
    glad_glVertexAttrib4f = @ptrCast(PFNGLVERTEXATTRIB4FPROC, load_fn(c"glVertexAttrib4f"));
    glad_glVertexAttrib4fv = @ptrCast(PFNGLVERTEXATTRIB4FVPROC, load_fn(c"glVertexAttrib4fv"));
    glad_glVertexAttrib4iv = @ptrCast(PFNGLVERTEXATTRIB4IVPROC, load_fn(c"glVertexAttrib4iv"));
    glad_glVertexAttrib4s = @ptrCast(PFNGLVERTEXATTRIB4SPROC, load_fn(c"glVertexAttrib4s"));
    glad_glVertexAttrib4sv = @ptrCast(PFNGLVERTEXATTRIB4SVPROC, load_fn(c"glVertexAttrib4sv"));
    glad_glVertexAttrib4ubv = @ptrCast(PFNGLVERTEXATTRIB4UBVPROC, load_fn(c"glVertexAttrib4ubv"));
    glad_glVertexAttrib4uiv = @ptrCast(PFNGLVERTEXATTRIB4UIVPROC, load_fn(c"glVertexAttrib4uiv"));
    glad_glVertexAttrib4usv = @ptrCast(PFNGLVERTEXATTRIB4USVPROC, load_fn(c"glVertexAttrib4usv"));
    glad_glVertexAttribPointer = @ptrCast(PFNGLVERTEXATTRIBPOINTERPROC, load_fn(c"glVertexAttribPointer"));
}
pub extern fn loadGL_2_1(load_fn: LoadFn) void {
    glad_glUniformMatrix2x3fv = @ptrCast(PFNGLUNIFORMMATRIX2X3FVPROC, load_fn(c"glUniformMatrix2x3fv"));
    glad_glUniformMatrix3x2fv = @ptrCast(PFNGLUNIFORMMATRIX3X2FVPROC, load_fn(c"glUniformMatrix3x2fv"));
    glad_glUniformMatrix2x4fv = @ptrCast(PFNGLUNIFORMMATRIX2X4FVPROC, load_fn(c"glUniformMatrix2x4fv"));
    glad_glUniformMatrix4x2fv = @ptrCast(PFNGLUNIFORMMATRIX4X2FVPROC, load_fn(c"glUniformMatrix4x2fv"));
    glad_glUniformMatrix3x4fv = @ptrCast(PFNGLUNIFORMMATRIX3X4FVPROC, load_fn(c"glUniformMatrix3x4fv"));
    glad_glUniformMatrix4x3fv = @ptrCast(PFNGLUNIFORMMATRIX4X3FVPROC, load_fn(c"glUniformMatrix4x3fv"));
}
pub extern fn loadGL_3_0(load_fn: LoadFn) void {
    glad_glColorMaski = @ptrCast(PFNGLCOLORMASKIPROC, load_fn(c"glColorMaski"));
    glad_glGetBooleani_v = @ptrCast(PFNGLGETBOOLEANI_VPROC, load_fn(c"glGetBooleani_v"));
    glad_glGetIntegeri_v = @ptrCast(PFNGLGETINTEGERI_VPROC, load_fn(c"glGetIntegeri_v"));
    glad_glEnablei = @ptrCast(PFNGLENABLEIPROC, load_fn(c"glEnablei"));
    glad_glDisablei = @ptrCast(PFNGLDISABLEIPROC, load_fn(c"glDisablei"));
    glad_glIsEnabledi = @ptrCast(PFNGLISENABLEDIPROC, load_fn(c"glIsEnabledi"));
    glad_glBeginTransformFeedback = @ptrCast(PFNGLBEGINTRANSFORMFEEDBACKPROC, load_fn(c"glBeginTransformFeedback"));
    glad_glEndTransformFeedback = @ptrCast(PFNGLENDTRANSFORMFEEDBACKPROC, load_fn(c"glEndTransformFeedback"));
    glad_glBindBufferRange = @ptrCast(PFNGLBINDBUFFERRANGEPROC, load_fn(c"glBindBufferRange"));
    glad_glBindBufferBase = @ptrCast(PFNGLBINDBUFFERBASEPROC, load_fn(c"glBindBufferBase"));
    glad_glTransformFeedbackVaryings = @ptrCast(PFNGLTRANSFORMFEEDBACKVARYINGSPROC, load_fn(c"glTransformFeedbackVaryings"));
    glad_glGetTransformFeedbackVarying = @ptrCast(PFNGLGETTRANSFORMFEEDBACKVARYINGPROC, load_fn(c"glGetTransformFeedbackVarying"));
    glad_glClampColor = @ptrCast(PFNGLCLAMPCOLORPROC, load_fn(c"glClampColor"));
    glad_glBeginConditionalRender = @ptrCast(PFNGLBEGINCONDITIONALRENDERPROC, load_fn(c"glBeginConditionalRender"));
    glad_glEndConditionalRender = @ptrCast(PFNGLENDCONDITIONALRENDERPROC, load_fn(c"glEndConditionalRender"));
    glad_glVertexAttribIPointer = @ptrCast(PFNGLVERTEXATTRIBIPOINTERPROC, load_fn(c"glVertexAttribIPointer"));
    glad_glGetVertexAttribIiv = @ptrCast(PFNGLGETVERTEXATTRIBIIVPROC, load_fn(c"glGetVertexAttribIiv"));
    glad_glGetVertexAttribIuiv = @ptrCast(PFNGLGETVERTEXATTRIBIUIVPROC, load_fn(c"glGetVertexAttribIuiv"));
    glad_glVertexAttribI1i = @ptrCast(PFNGLVERTEXATTRIBI1IPROC, load_fn(c"glVertexAttribI1i"));
    glad_glVertexAttribI2i = @ptrCast(PFNGLVERTEXATTRIBI2IPROC, load_fn(c"glVertexAttribI2i"));
    glad_glVertexAttribI3i = @ptrCast(PFNGLVERTEXATTRIBI3IPROC, load_fn(c"glVertexAttribI3i"));
    glad_glVertexAttribI4i = @ptrCast(PFNGLVERTEXATTRIBI4IPROC, load_fn(c"glVertexAttribI4i"));
    glad_glVertexAttribI1ui = @ptrCast(PFNGLVERTEXATTRIBI1UIPROC, load_fn(c"glVertexAttribI1ui"));
    glad_glVertexAttribI2ui = @ptrCast(PFNGLVERTEXATTRIBI2UIPROC, load_fn(c"glVertexAttribI2ui"));
    glad_glVertexAttribI3ui = @ptrCast(PFNGLVERTEXATTRIBI3UIPROC, load_fn(c"glVertexAttribI3ui"));
    glad_glVertexAttribI4ui = @ptrCast(PFNGLVERTEXATTRIBI4UIPROC, load_fn(c"glVertexAttribI4ui"));
    glad_glVertexAttribI1iv = @ptrCast(PFNGLVERTEXATTRIBI1IVPROC, load_fn(c"glVertexAttribI1iv"));
    glad_glVertexAttribI2iv = @ptrCast(PFNGLVERTEXATTRIBI2IVPROC, load_fn(c"glVertexAttribI2iv"));
    glad_glVertexAttribI3iv = @ptrCast(PFNGLVERTEXATTRIBI3IVPROC, load_fn(c"glVertexAttribI3iv"));
    glad_glVertexAttribI4iv = @ptrCast(PFNGLVERTEXATTRIBI4IVPROC, load_fn(c"glVertexAttribI4iv"));
    glad_glVertexAttribI1uiv = @ptrCast(PFNGLVERTEXATTRIBI1UIVPROC, load_fn(c"glVertexAttribI1uiv"));
    glad_glVertexAttribI2uiv = @ptrCast(PFNGLVERTEXATTRIBI2UIVPROC, load_fn(c"glVertexAttribI2uiv"));
    glad_glVertexAttribI3uiv = @ptrCast(PFNGLVERTEXATTRIBI3UIVPROC, load_fn(c"glVertexAttribI3uiv"));
    glad_glVertexAttribI4uiv = @ptrCast(PFNGLVERTEXATTRIBI4UIVPROC, load_fn(c"glVertexAttribI4uiv"));
    glad_glVertexAttribI4bv = @ptrCast(PFNGLVERTEXATTRIBI4BVPROC, load_fn(c"glVertexAttribI4bv"));
    glad_glVertexAttribI4sv = @ptrCast(PFNGLVERTEXATTRIBI4SVPROC, load_fn(c"glVertexAttribI4sv"));
    glad_glVertexAttribI4ubv = @ptrCast(PFNGLVERTEXATTRIBI4UBVPROC, load_fn(c"glVertexAttribI4ubv"));
    glad_glVertexAttribI4usv = @ptrCast(PFNGLVERTEXATTRIBI4USVPROC, load_fn(c"glVertexAttribI4usv"));
    glad_glGetUniformuiv = @ptrCast(PFNGLGETUNIFORMUIVPROC, load_fn(c"glGetUniformuiv"));
    glad_glBindFragDataLocation = @ptrCast(PFNGLBINDFRAGDATALOCATIONPROC, load_fn(c"glBindFragDataLocation"));
    glad_glGetFragDataLocation = @ptrCast(PFNGLGETFRAGDATALOCATIONPROC, load_fn(c"glGetFragDataLocation"));
    glad_glUniform1ui = @ptrCast(PFNGLUNIFORM1UIPROC, load_fn(c"glUniform1ui"));
    glad_glUniform2ui = @ptrCast(PFNGLUNIFORM2UIPROC, load_fn(c"glUniform2ui"));
    glad_glUniform3ui = @ptrCast(PFNGLUNIFORM3UIPROC, load_fn(c"glUniform3ui"));
    glad_glUniform4ui = @ptrCast(PFNGLUNIFORM4UIPROC, load_fn(c"glUniform4ui"));
    glad_glUniform1uiv = @ptrCast(PFNGLUNIFORM1UIVPROC, load_fn(c"glUniform1uiv"));
    glad_glUniform2uiv = @ptrCast(PFNGLUNIFORM2UIVPROC, load_fn(c"glUniform2uiv"));
    glad_glUniform3uiv = @ptrCast(PFNGLUNIFORM3UIVPROC, load_fn(c"glUniform3uiv"));
    glad_glUniform4uiv = @ptrCast(PFNGLUNIFORM4UIVPROC, load_fn(c"glUniform4uiv"));
    glad_glTexParameterIiv = @ptrCast(PFNGLTEXPARAMETERIIVPROC, load_fn(c"glTexParameterIiv"));
    glad_glTexParameterIuiv = @ptrCast(PFNGLTEXPARAMETERIUIVPROC, load_fn(c"glTexParameterIuiv"));
    glad_glGetTexParameterIiv = @ptrCast(PFNGLGETTEXPARAMETERIIVPROC, load_fn(c"glGetTexParameterIiv"));
    glad_glGetTexParameterIuiv = @ptrCast(PFNGLGETTEXPARAMETERIUIVPROC, load_fn(c"glGetTexParameterIuiv"));
    glad_glClearBufferiv = @ptrCast(PFNGLCLEARBUFFERIVPROC, load_fn(c"glClearBufferiv"));
    glad_glClearBufferuiv = @ptrCast(PFNGLCLEARBUFFERUIVPROC, load_fn(c"glClearBufferuiv"));
    glad_glClearBufferfv = @ptrCast(PFNGLCLEARBUFFERFVPROC, load_fn(c"glClearBufferfv"));
    glad_glClearBufferfi = @ptrCast(PFNGLCLEARBUFFERFIPROC, load_fn(c"glClearBufferfi"));
    glad_glGetStringi = @ptrCast(PFNGLGETSTRINGIPROC, load_fn(c"glGetStringi"));
    glad_glIsRenderbuffer = @ptrCast(PFNGLISRENDERBUFFERPROC, load_fn(c"glIsRenderbuffer"));
    glad_glBindRenderbuffer = @ptrCast(PFNGLBINDRENDERBUFFERPROC, load_fn(c"glBindRenderbuffer"));
    glad_glDeleteRenderbuffers = @ptrCast(PFNGLDELETERENDERBUFFERSPROC, load_fn(c"glDeleteRenderbuffers"));
    glad_glGenRenderbuffers = @ptrCast(PFNGLGENRENDERBUFFERSPROC, load_fn(c"glGenRenderbuffers"));
    glad_glRenderbufferStorage = @ptrCast(PFNGLRENDERBUFFERSTORAGEPROC, load_fn(c"glRenderbufferStorage"));
    glad_glGetRenderbufferParameteriv = @ptrCast(PFNGLGETRENDERBUFFERPARAMETERIVPROC, load_fn(c"glGetRenderbufferParameteriv"));
    glad_glIsFramebuffer = @ptrCast(PFNGLISFRAMEBUFFERPROC, load_fn(c"glIsFramebuffer"));
    glad_glBindFramebuffer = @ptrCast(PFNGLBINDFRAMEBUFFERPROC, load_fn(c"glBindFramebuffer"));
    glad_glDeleteFramebuffers = @ptrCast(PFNGLDELETEFRAMEBUFFERSPROC, load_fn(c"glDeleteFramebuffers"));
    glad_glGenFramebuffers = @ptrCast(PFNGLGENFRAMEBUFFERSPROC, load_fn(c"glGenFramebuffers"));
    glad_glCheckFramebufferStatus = @ptrCast(PFNGLCHECKFRAMEBUFFERSTATUSPROC, load_fn(c"glCheckFramebufferStatus"));
    glad_glFramebufferTexture1D = @ptrCast(PFNGLFRAMEBUFFERTEXTURE1DPROC, load_fn(c"glFramebufferTexture1D"));
    glad_glFramebufferTexture2D = @ptrCast(PFNGLFRAMEBUFFERTEXTURE2DPROC, load_fn(c"glFramebufferTexture2D"));
    glad_glFramebufferTexture3D = @ptrCast(PFNGLFRAMEBUFFERTEXTURE3DPROC, load_fn(c"glFramebufferTexture3D"));
    glad_glFramebufferRenderbuffer = @ptrCast(PFNGLFRAMEBUFFERRENDERBUFFERPROC, load_fn(c"glFramebufferRenderbuffer"));
    glad_glGetFramebufferAttachmentParameteriv = @ptrCast(PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC, load_fn(c"glGetFramebufferAttachmentParameteriv"));
    glad_glGenerateMipmap = @ptrCast(PFNGLGENERATEMIPMAPPROC, load_fn(c"glGenerateMipmap"));
    glad_glBlitFramebuffer = @ptrCast(PFNGLBLITFRAMEBUFFERPROC, load_fn(c"glBlitFramebuffer"));
    glad_glRenderbufferStorageMultisample = @ptrCast(PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC, load_fn(c"glRenderbufferStorageMultisample"));
    glad_glFramebufferTextureLayer = @ptrCast(PFNGLFRAMEBUFFERTEXTURELAYERPROC, load_fn(c"glFramebufferTextureLayer"));
    glad_glMapBufferRange = @ptrCast(PFNGLMAPBUFFERRANGEPROC, load_fn(c"glMapBufferRange"));
    glad_glFlushMappedBufferRange = @ptrCast(PFNGLFLUSHMAPPEDBUFFERRANGEPROC, load_fn(c"glFlushMappedBufferRange"));
    glad_glBindVertexArray = @ptrCast(PFNGLBINDVERTEXARRAYPROC, load_fn(c"glBindVertexArray"));
    glad_glDeleteVertexArrays = @ptrCast(PFNGLDELETEVERTEXARRAYSPROC, load_fn(c"glDeleteVertexArrays"));
    glad_glGenVertexArrays = @ptrCast(PFNGLGENVERTEXARRAYSPROC, load_fn(c"glGenVertexArrays"));
    glad_glIsVertexArray = @ptrCast(PFNGLISVERTEXARRAYPROC, load_fn(c"glIsVertexArray"));
}
pub extern fn loadGL_3_1(load_fn: LoadFn) void {
    glad_glDrawArraysInstanced = @ptrCast(PFNGLDRAWARRAYSINSTANCEDPROC, load_fn(c"glDrawArraysInstanced"));
    glad_glDrawElementsInstanced = @ptrCast(PFNGLDRAWELEMENTSINSTANCEDPROC, load_fn(c"glDrawElementsInstanced"));
    glad_glTexBuffer = @ptrCast(PFNGLTEXBUFFERPROC, load_fn(c"glTexBuffer"));
    glad_glPrimitiveRestartIndex = @ptrCast(PFNGLPRIMITIVERESTARTINDEXPROC, load_fn(c"glPrimitiveRestartIndex"));
    glad_glCopyBufferSubData = @ptrCast(PFNGLCOPYBUFFERSUBDATAPROC, load_fn(c"glCopyBufferSubData"));
    glad_glGetUniformIndices = @ptrCast(PFNGLGETUNIFORMINDICESPROC, load_fn(c"glGetUniformIndices"));
    glad_glGetActiveUniformsiv = @ptrCast(PFNGLGETACTIVEUNIFORMSIVPROC, load_fn(c"glGetActiveUniformsiv"));
    glad_glGetActiveUniformName = @ptrCast(PFNGLGETACTIVEUNIFORMNAMEPROC, load_fn(c"glGetActiveUniformName"));
    glad_glGetUniformBlockIndex = @ptrCast(PFNGLGETUNIFORMBLOCKINDEXPROC, load_fn(c"glGetUniformBlockIndex"));
    glad_glGetActiveUniformBlockiv = @ptrCast(PFNGLGETACTIVEUNIFORMBLOCKIVPROC, load_fn(c"glGetActiveUniformBlockiv"));
    glad_glGetActiveUniformBlockName = @ptrCast(PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC, load_fn(c"glGetActiveUniformBlockName"));
    glad_glUniformBlockBinding = @ptrCast(PFNGLUNIFORMBLOCKBINDINGPROC, load_fn(c"glUniformBlockBinding"));
    glad_glBindBufferRange = @ptrCast(PFNGLBINDBUFFERRANGEPROC, load_fn(c"glBindBufferRange"));
    glad_glBindBufferBase = @ptrCast(PFNGLBINDBUFFERBASEPROC, load_fn(c"glBindBufferBase"));
    glad_glGetIntegeri_v = @ptrCast(PFNGLGETINTEGERI_VPROC, load_fn(c"glGetIntegeri_v"));
}
pub extern fn loadGL_3_2(load_fn: LoadFn) void {
    glad_glDrawElementsBaseVertex = @ptrCast(PFNGLDRAWELEMENTSBASEVERTEXPROC, load_fn(c"glDrawElementsBaseVertex"));
    glad_glDrawRangeElementsBaseVertex = @ptrCast(PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC, load_fn(c"glDrawRangeElementsBaseVertex"));
    glad_glDrawElementsInstancedBaseVertex = @ptrCast(PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC, load_fn(c"glDrawElementsInstancedBaseVertex"));
    glad_glMultiDrawElementsBaseVertex = @ptrCast(PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC, load_fn(c"glMultiDrawElementsBaseVertex"));
    glad_glProvokingVertex = @ptrCast(PFNGLPROVOKINGVERTEXPROC, load_fn(c"glProvokingVertex"));
    glad_glFenceSync = @ptrCast(PFNGLFENCESYNCPROC, load_fn(c"glFenceSync"));
    glad_glIsSync = @ptrCast(PFNGLISSYNCPROC, load_fn(c"glIsSync"));
    glad_glDeleteSync = @ptrCast(PFNGLDELETESYNCPROC, load_fn(c"glDeleteSync"));
    glad_glClientWaitSync = @ptrCast(PFNGLCLIENTWAITSYNCPROC, load_fn(c"glClientWaitSync"));
    glad_glWaitSync = @ptrCast(PFNGLWAITSYNCPROC, load_fn(c"glWaitSync"));
    glad_glGetInteger64v = @ptrCast(PFNGLGETINTEGER64VPROC, load_fn(c"glGetInteger64v"));
    glad_glGetSynciv = @ptrCast(PFNGLGETSYNCIVPROC, load_fn(c"glGetSynciv"));
    glad_glGetInteger64i_v = @ptrCast(PFNGLGETINTEGER64I_VPROC, load_fn(c"glGetInteger64i_v"));
    glad_glGetBufferParameteri64v = @ptrCast(PFNGLGETBUFFERPARAMETERI64VPROC, load_fn(c"glGetBufferParameteri64v"));
    glad_glFramebufferTexture = @ptrCast(PFNGLFRAMEBUFFERTEXTUREPROC, load_fn(c"glFramebufferTexture"));
    glad_glTexImage2DMultisample = @ptrCast(PFNGLTEXIMAGE2DMULTISAMPLEPROC, load_fn(c"glTexImage2DMultisample"));
    glad_glTexImage3DMultisample = @ptrCast(PFNGLTEXIMAGE3DMULTISAMPLEPROC, load_fn(c"glTexImage3DMultisample"));
    glad_glGetMultisamplefv = @ptrCast(PFNGLGETMULTISAMPLEFVPROC, load_fn(c"glGetMultisamplefv"));
    glad_glSampleMaski = @ptrCast(PFNGLSAMPLEMASKIPROC, load_fn(c"glSampleMaski"));
}
pub extern fn loadGL_3_3(load_fn: LoadFn) void {
    glad_glBindFragDataLocationIndexed = @ptrCast(PFNGLBINDFRAGDATALOCATIONINDEXEDPROC, load_fn(c"glBindFragDataLocationIndexed"));
    glad_glGetFragDataIndex = @ptrCast(PFNGLGETFRAGDATAINDEXPROC, load_fn(c"glGetFragDataIndex"));
    glad_glGenSamplers = @ptrCast(PFNGLGENSAMPLERSPROC, load_fn(c"glGenSamplers"));
    glad_glDeleteSamplers = @ptrCast(PFNGLDELETESAMPLERSPROC, load_fn(c"glDeleteSamplers"));
    glad_glIsSampler = @ptrCast(PFNGLISSAMPLERPROC, load_fn(c"glIsSampler"));
    glad_glBindSampler = @ptrCast(PFNGLBINDSAMPLERPROC, load_fn(c"glBindSampler"));
    glad_glSamplerParameteri = @ptrCast(PFNGLSAMPLERPARAMETERIPROC, load_fn(c"glSamplerParameteri"));
    glad_glSamplerParameteriv = @ptrCast(PFNGLSAMPLERPARAMETERIVPROC, load_fn(c"glSamplerParameteriv"));
    glad_glSamplerParameterf = @ptrCast(PFNGLSAMPLERPARAMETERFPROC, load_fn(c"glSamplerParameterf"));
    glad_glSamplerParameterfv = @ptrCast(PFNGLSAMPLERPARAMETERFVPROC, load_fn(c"glSamplerParameterfv"));
    glad_glSamplerParameterIiv = @ptrCast(PFNGLSAMPLERPARAMETERIIVPROC, load_fn(c"glSamplerParameterIiv"));
    glad_glSamplerParameterIuiv = @ptrCast(PFNGLSAMPLERPARAMETERIUIVPROC, load_fn(c"glSamplerParameterIuiv"));
    glad_glGetSamplerParameteriv = @ptrCast(PFNGLGETSAMPLERPARAMETERIVPROC, load_fn(c"glGetSamplerParameteriv"));
    glad_glGetSamplerParameterIiv = @ptrCast(PFNGLGETSAMPLERPARAMETERIIVPROC, load_fn(c"glGetSamplerParameterIiv"));
    glad_glGetSamplerParameterfv = @ptrCast(PFNGLGETSAMPLERPARAMETERFVPROC, load_fn(c"glGetSamplerParameterfv"));
    glad_glGetSamplerParameterIuiv = @ptrCast(PFNGLGETSAMPLERPARAMETERIUIVPROC, load_fn(c"glGetSamplerParameterIuiv"));
    glad_glQueryCounter = @ptrCast(PFNGLQUERYCOUNTERPROC, load_fn(c"glQueryCounter"));
    glad_glGetQueryObjecti64v = @ptrCast(PFNGLGETQUERYOBJECTI64VPROC, load_fn(c"glGetQueryObjecti64v"));
    glad_glGetQueryObjectui64v = @ptrCast(PFNGLGETQUERYOBJECTUI64VPROC, load_fn(c"glGetQueryObjectui64v"));
    glad_glVertexAttribDivisor = @ptrCast(PFNGLVERTEXATTRIBDIVISORPROC, load_fn(c"glVertexAttribDivisor"));
    glad_glVertexAttribP1ui = @ptrCast(PFNGLVERTEXATTRIBP1UIPROC, load_fn(c"glVertexAttribP1ui"));
    glad_glVertexAttribP1uiv = @ptrCast(PFNGLVERTEXATTRIBP1UIVPROC, load_fn(c"glVertexAttribP1uiv"));
    glad_glVertexAttribP2ui = @ptrCast(PFNGLVERTEXATTRIBP2UIPROC, load_fn(c"glVertexAttribP2ui"));
    glad_glVertexAttribP2uiv = @ptrCast(PFNGLVERTEXATTRIBP2UIVPROC, load_fn(c"glVertexAttribP2uiv"));
    glad_glVertexAttribP3ui = @ptrCast(PFNGLVERTEXATTRIBP3UIPROC, load_fn(c"glVertexAttribP3ui"));
    glad_glVertexAttribP3uiv = @ptrCast(PFNGLVERTEXATTRIBP3UIVPROC, load_fn(c"glVertexAttribP3uiv"));
    glad_glVertexAttribP4ui = @ptrCast(PFNGLVERTEXATTRIBP4UIPROC, load_fn(c"glVertexAttribP4ui"));
    glad_glVertexAttribP4uiv = @ptrCast(PFNGLVERTEXATTRIBP4UIVPROC, load_fn(c"glVertexAttribP4uiv"));
    glad_glVertexP2ui = @ptrCast(PFNGLVERTEXP2UIPROC, load_fn(c"glVertexP2ui"));
    glad_glVertexP2uiv = @ptrCast(PFNGLVERTEXP2UIVPROC, load_fn(c"glVertexP2uiv"));
    glad_glVertexP3ui = @ptrCast(PFNGLVERTEXP3UIPROC, load_fn(c"glVertexP3ui"));
    glad_glVertexP3uiv = @ptrCast(PFNGLVERTEXP3UIVPROC, load_fn(c"glVertexP3uiv"));
    glad_glVertexP4ui = @ptrCast(PFNGLVERTEXP4UIPROC, load_fn(c"glVertexP4ui"));
    glad_glVertexP4uiv = @ptrCast(PFNGLVERTEXP4UIVPROC, load_fn(c"glVertexP4uiv"));
    glad_glTexCoordP1ui = @ptrCast(PFNGLTEXCOORDP1UIPROC, load_fn(c"glTexCoordP1ui"));
    glad_glTexCoordP1uiv = @ptrCast(PFNGLTEXCOORDP1UIVPROC, load_fn(c"glTexCoordP1uiv"));
    glad_glTexCoordP2ui = @ptrCast(PFNGLTEXCOORDP2UIPROC, load_fn(c"glTexCoordP2ui"));
    glad_glTexCoordP2uiv = @ptrCast(PFNGLTEXCOORDP2UIVPROC, load_fn(c"glTexCoordP2uiv"));
    glad_glTexCoordP3ui = @ptrCast(PFNGLTEXCOORDP3UIPROC, load_fn(c"glTexCoordP3ui"));
    glad_glTexCoordP3uiv = @ptrCast(PFNGLTEXCOORDP3UIVPROC, load_fn(c"glTexCoordP3uiv"));
    glad_glTexCoordP4ui = @ptrCast(PFNGLTEXCOORDP4UIPROC, load_fn(c"glTexCoordP4ui"));
    glad_glTexCoordP4uiv = @ptrCast(PFNGLTEXCOORDP4UIVPROC, load_fn(c"glTexCoordP4uiv"));
    glad_glMultiTexCoordP1ui = @ptrCast(PFNGLMULTITEXCOORDP1UIPROC, load_fn(c"glMultiTexCoordP1ui"));
    glad_glMultiTexCoordP1uiv = @ptrCast(PFNGLMULTITEXCOORDP1UIVPROC, load_fn(c"glMultiTexCoordP1uiv"));
    glad_glMultiTexCoordP2ui = @ptrCast(PFNGLMULTITEXCOORDP2UIPROC, load_fn(c"glMultiTexCoordP2ui"));
    glad_glMultiTexCoordP2uiv = @ptrCast(PFNGLMULTITEXCOORDP2UIVPROC, load_fn(c"glMultiTexCoordP2uiv"));
    glad_glMultiTexCoordP3ui = @ptrCast(PFNGLMULTITEXCOORDP3UIPROC, load_fn(c"glMultiTexCoordP3ui"));
    glad_glMultiTexCoordP3uiv = @ptrCast(PFNGLMULTITEXCOORDP3UIVPROC, load_fn(c"glMultiTexCoordP3uiv"));
    glad_glMultiTexCoordP4ui = @ptrCast(PFNGLMULTITEXCOORDP4UIPROC, load_fn(c"glMultiTexCoordP4ui"));
    glad_glMultiTexCoordP4uiv = @ptrCast(PFNGLMULTITEXCOORDP4UIVPROC, load_fn(c"glMultiTexCoordP4uiv"));
    glad_glNormalP3ui = @ptrCast(PFNGLNORMALP3UIPROC, load_fn(c"glNormalP3ui"));
    glad_glNormalP3uiv = @ptrCast(PFNGLNORMALP3UIVPROC, load_fn(c"glNormalP3uiv"));
    glad_glColorP3ui = @ptrCast(PFNGLCOLORP3UIPROC, load_fn(c"glColorP3ui"));
    glad_glColorP3uiv = @ptrCast(PFNGLCOLORP3UIVPROC, load_fn(c"glColorP3uiv"));
    glad_glColorP4ui = @ptrCast(PFNGLCOLORP4UIPROC, load_fn(c"glColorP4ui"));
    glad_glColorP4uiv = @ptrCast(PFNGLCOLORP4UIVPROC, load_fn(c"glColorP4uiv"));
    glad_glSecondaryColorP3ui = @ptrCast(PFNGLSECONDARYCOLORP3UIPROC, load_fn(c"glSecondaryColorP3ui"));
    glad_glSecondaryColorP3uiv = @ptrCast(PFNGLSECONDARYCOLORP3UIVPROC, load_fn(c"glSecondaryColorP3uiv"));
}

pub const GLubyte = u8;
pub const GLenum = c_uint;
pub const PFNGLGETSTRINGPROC = ?extern fn(GLenum) ?[*]const GLubyte;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong,
    __clang_max_align_nonce2: c_longdouble,
};
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = ?[*]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const __gwchar_t = c_int;
pub const imaxdiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub extern fn imaxabs(__n: intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: ?[*]const u8, noalias __endptr: ?[*](?[*]u8), __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: ?[*]const u8, noalias __endptr: ?[*](?[*]u8), __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: ?[*]const __gwchar_t, noalias __endptr: ?[*](?[*]__gwchar_t), __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: ?[*]const __gwchar_t, noalias __endptr: ?[*](?[*]__gwchar_t), __base: c_int) uintmax_t;
pub const GLboolean = u8;
pub const GLbitfield = c_uint;
pub const GLvoid = c_void;
pub const GLbyte = i8;
pub const GLshort = c_short;
pub const GLint = c_int;
pub const GLclampx = c_int;
pub const GLushort = c_ushort;
pub const GLuint = c_uint;
pub const GLsizei = c_int;
pub const GLfloat = f32;
pub const GLclampf = f32;
pub const GLdouble = f64;
pub const GLclampd = f64;
pub const GLeglClientBufferEXT = ?*c_void;
pub const GLeglImageOES = ?*c_void;
pub const GLchar = u8;
pub const GLcharARB = u8;
pub const GLhandleARB = c_uint;
pub const GLhalfARB = c_ushort;
pub const GLhalf = c_ushort;
pub const GLfixed = GLint;
pub const GLintptr = ptrdiff_t;
pub const GLsizeiptr = ptrdiff_t;
pub const GLint64 = i64;
pub const GLuint64 = u64;
pub const GLintptrARB = ptrdiff_t;
pub const GLsizeiptrARB = ptrdiff_t;
pub const GLint64EXT = i64;
pub const GLuint64EXT = u64;
pub const struct___GLsync = @OpaqueType();
pub const GLsync = ?*struct___GLsync;
pub const struct__cl_context = @OpaqueType();
pub const struct__cl_event = @OpaqueType();
pub const GLDEBUGPROC = ?extern fn(GLenum, GLenum, GLuint, GLenum, GLsizei, ?[*]const GLchar, ?*const c_void) void;
pub const GLDEBUGPROCARB = ?extern fn(GLenum, GLenum, GLuint, GLenum, GLsizei, ?[*]const GLchar, ?*const c_void) void;
pub const GLDEBUGPROCKHR = ?extern fn(GLenum, GLenum, GLuint, GLenum, GLsizei, ?[*]const GLchar, ?*const c_void) void;
pub const GLDEBUGPROCAMD = ?extern fn(GLuint, GLenum, GLenum, GLsizei, ?[*]const GLchar, ?*c_void) void;
pub const GLhalfNV = c_ushort;
pub const GLvdpauSurfaceNV = GLintptr;
pub const GLVULKANPROCNV = ?extern fn() void;
pub const PFNGLCULLFACEPROC = ?extern fn(GLenum) void;
pub var glad_glCullFace: PFNGLCULLFACEPROC = null;
pub const PFNGLFRONTFACEPROC = ?extern fn(GLenum) void;
pub var glad_glFrontFace: PFNGLFRONTFACEPROC = null;
pub const PFNGLHINTPROC = ?extern fn(GLenum, GLenum) void;
pub var glad_glHint: PFNGLHINTPROC = null;
pub const PFNGLLINEWIDTHPROC = ?extern fn(GLfloat) void;
pub var glad_glLineWidth: PFNGLLINEWIDTHPROC = null;
pub const PFNGLPOINTSIZEPROC = ?extern fn(GLfloat) void;
pub var glad_glPointSize: PFNGLPOINTSIZEPROC = null;
pub const PFNGLPOLYGONMODEPROC = ?extern fn(GLenum, GLenum) void;
pub var glad_glPolygonMode: PFNGLPOLYGONMODEPROC = null;
pub const PFNGLSCISSORPROC = ?extern fn(GLint, GLint, GLsizei, GLsizei) void;
pub var glad_glScissor: PFNGLSCISSORPROC = null;
pub const PFNGLTEXPARAMETERFPROC = ?extern fn(GLenum, GLenum, GLfloat) void;
pub var glad_glTexParameterf: PFNGLTEXPARAMETERFPROC = null;
pub const PFNGLTEXPARAMETERFVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLfloat) void;
pub var glad_glTexParameterfv: PFNGLTEXPARAMETERFVPROC = null;
pub const PFNGLTEXPARAMETERIPROC = ?extern fn(GLenum, GLenum, GLint) void;
pub var glad_glTexParameteri: PFNGLTEXPARAMETERIPROC = null;
pub const PFNGLTEXPARAMETERIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLint) void;
pub var glad_glTexParameteriv: PFNGLTEXPARAMETERIVPROC = null;
pub const PFNGLTEXIMAGE1DPROC = ?extern fn(GLenum, GLint, GLint, GLsizei, GLint, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexImage1D: PFNGLTEXIMAGE1DPROC = null;
pub const PFNGLTEXIMAGE2DPROC = ?extern fn(GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexImage2D: PFNGLTEXIMAGE2DPROC = null;
pub const PFNGLDRAWBUFFERPROC = ?extern fn(GLenum) void;
pub var glad_glDrawBuffer: PFNGLDRAWBUFFERPROC = null;
pub const PFNGLCLEARPROC = ?extern fn(GLbitfield) void;
pub var glad_glClear: PFNGLCLEARPROC = null;
pub const PFNGLCLEARCOLORPROC = ?extern fn(GLfloat, GLfloat, GLfloat, GLfloat) void;
pub var glad_glClearColor: PFNGLCLEARCOLORPROC = null;
pub const PFNGLCLEARSTENCILPROC = ?extern fn(GLint) void;
pub var glad_glClearStencil: PFNGLCLEARSTENCILPROC = null;
pub const PFNGLCLEARDEPTHPROC = ?extern fn(GLdouble) void;
pub var glad_glClearDepth: PFNGLCLEARDEPTHPROC = null;
pub const PFNGLSTENCILMASKPROC = ?extern fn(GLuint) void;
pub var glad_glStencilMask: PFNGLSTENCILMASKPROC = null;
pub const PFNGLCOLORMASKPROC = ?extern fn(GLboolean, GLboolean, GLboolean, GLboolean) void;
pub var glad_glColorMask: PFNGLCOLORMASKPROC = null;
pub const PFNGLDEPTHMASKPROC = ?extern fn(GLboolean) void;
pub var glad_glDepthMask: PFNGLDEPTHMASKPROC = null;
pub const PFNGLDISABLEPROC = ?extern fn(GLenum) void;
pub var glad_glDisable: PFNGLDISABLEPROC = null;
pub const PFNGLENABLEPROC = ?extern fn(GLenum) void;
pub var glad_glEnable: PFNGLENABLEPROC = null;
pub const PFNGLFINISHPROC = ?extern fn() void;
pub var glad_glFinish: PFNGLFINISHPROC = null;
pub const PFNGLFLUSHPROC = ?extern fn() void;
pub var glad_glFlush: PFNGLFLUSHPROC = null;
pub const PFNGLBLENDFUNCPROC = ?extern fn(GLenum, GLenum) void;
pub var glad_glBlendFunc: PFNGLBLENDFUNCPROC = null;
pub const PFNGLLOGICOPPROC = ?extern fn(GLenum) void;
pub var glad_glLogicOp: PFNGLLOGICOPPROC = null;
pub const PFNGLSTENCILFUNCPROC = ?extern fn(GLenum, GLint, GLuint) void;
pub var glad_glStencilFunc: PFNGLSTENCILFUNCPROC = null;
pub const PFNGLSTENCILOPPROC = ?extern fn(GLenum, GLenum, GLenum) void;
pub var glad_glStencilOp: PFNGLSTENCILOPPROC = null;
pub const PFNGLDEPTHFUNCPROC = ?extern fn(GLenum) void;
pub var glad_glDepthFunc: PFNGLDEPTHFUNCPROC = null;
pub const PFNGLPIXELSTOREFPROC = ?extern fn(GLenum, GLfloat) void;
pub var glad_glPixelStoref: PFNGLPIXELSTOREFPROC = null;
pub const PFNGLPIXELSTOREIPROC = ?extern fn(GLenum, GLint) void;
pub var glad_glPixelStorei: PFNGLPIXELSTOREIPROC = null;
pub const PFNGLREADBUFFERPROC = ?extern fn(GLenum) void;
pub var glad_glReadBuffer: PFNGLREADBUFFERPROC = null;
pub const PFNGLREADPIXELSPROC = ?extern fn(GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*c_void) void;
pub var glad_glReadPixels: PFNGLREADPIXELSPROC = null;
pub const PFNGLGETBOOLEANVPROC = ?extern fn(GLenum, ?[*]GLboolean) void;
pub var glad_glGetBooleanv: PFNGLGETBOOLEANVPROC = null;
pub const PFNGLGETDOUBLEVPROC = ?extern fn(GLenum, ?[*]GLdouble) void;
pub var glad_glGetDoublev: PFNGLGETDOUBLEVPROC = null;
pub const PFNGLGETERRORPROC = ?extern fn() GLenum;
pub var glad_glGetError: PFNGLGETERRORPROC = null;
pub const PFNGLGETFLOATVPROC = ?extern fn(GLenum, ?[*]GLfloat) void;
pub var glad_glGetFloatv: PFNGLGETFLOATVPROC = null;
pub const PFNGLGETINTEGERVPROC = ?extern fn(GLenum, ?[*]GLint) void;
pub var glad_glGetIntegerv: PFNGLGETINTEGERVPROC = null;
pub var glad_glGetString: PFNGLGETSTRINGPROC = null;
pub const PFNGLGETTEXIMAGEPROC = ?extern fn(GLenum, GLint, GLenum, GLenum, ?*c_void) void;
pub var glad_glGetTexImage: PFNGLGETTEXIMAGEPROC = null;
pub const PFNGLGETTEXPARAMETERFVPROC = ?extern fn(GLenum, GLenum, ?[*]GLfloat) void;
pub var glad_glGetTexParameterfv: PFNGLGETTEXPARAMETERFVPROC = null;
pub const PFNGLGETTEXPARAMETERIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetTexParameteriv: PFNGLGETTEXPARAMETERIVPROC = null;
pub const PFNGLGETTEXLEVELPARAMETERFVPROC = ?extern fn(GLenum, GLint, GLenum, ?[*]GLfloat) void;
pub var glad_glGetTexLevelParameterfv: PFNGLGETTEXLEVELPARAMETERFVPROC = null;
pub const PFNGLGETTEXLEVELPARAMETERIVPROC = ?extern fn(GLenum, GLint, GLenum, ?[*]GLint) void;
pub var glad_glGetTexLevelParameteriv: PFNGLGETTEXLEVELPARAMETERIVPROC = null;
pub const PFNGLISENABLEDPROC = ?extern fn(GLenum) GLboolean;
pub var glad_glIsEnabled: PFNGLISENABLEDPROC = null;
pub const PFNGLDEPTHRANGEPROC = ?extern fn(GLdouble, GLdouble) void;
pub var glad_glDepthRange: PFNGLDEPTHRANGEPROC = null;
pub const PFNGLVIEWPORTPROC = ?extern fn(GLint, GLint, GLsizei, GLsizei) void;
pub var glad_glViewport: PFNGLVIEWPORTPROC = null;
pub const PFNGLDRAWARRAYSPROC = ?extern fn(GLenum, GLint, GLsizei) void;
pub var glad_glDrawArrays: PFNGLDRAWARRAYSPROC = null;
pub const PFNGLDRAWELEMENTSPROC = ?extern fn(GLenum, GLsizei, GLenum, ?*const c_void) void;
pub var glad_glDrawElements: PFNGLDRAWELEMENTSPROC = null;
pub const PFNGLPOLYGONOFFSETPROC = ?extern fn(GLfloat, GLfloat) void;
pub var glad_glPolygonOffset: PFNGLPOLYGONOFFSETPROC = null;
pub const PFNGLCOPYTEXIMAGE1DPROC = ?extern fn(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint) void;
pub var glad_glCopyTexImage1D: PFNGLCOPYTEXIMAGE1DPROC = null;
pub const PFNGLCOPYTEXIMAGE2DPROC = ?extern fn(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint) void;
pub var glad_glCopyTexImage2D: PFNGLCOPYTEXIMAGE2DPROC = null;
pub const PFNGLCOPYTEXSUBIMAGE1DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLint, GLsizei) void;
pub var glad_glCopyTexSubImage1D: PFNGLCOPYTEXSUBIMAGE1DPROC = null;
pub const PFNGLCOPYTEXSUBIMAGE2DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) void;
pub var glad_glCopyTexSubImage2D: PFNGLCOPYTEXSUBIMAGE2DPROC = null;
pub const PFNGLTEXSUBIMAGE1DPROC = ?extern fn(GLenum, GLint, GLint, GLsizei, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexSubImage1D: PFNGLTEXSUBIMAGE1DPROC = null;
pub const PFNGLTEXSUBIMAGE2DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexSubImage2D: PFNGLTEXSUBIMAGE2DPROC = null;
pub const PFNGLBINDTEXTUREPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glBindTexture: PFNGLBINDTEXTUREPROC = null;
pub const PFNGLDELETETEXTURESPROC = ?extern fn(GLsizei, ?[*]const GLuint) void;
pub var glad_glDeleteTextures: PFNGLDELETETEXTURESPROC = null;
pub const PFNGLGENTEXTURESPROC = ?extern fn(GLsizei, ?[*]GLuint) void;
pub var glad_glGenTextures: PFNGLGENTEXTURESPROC = null;
pub const PFNGLISTEXTUREPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsTexture: PFNGLISTEXTUREPROC = null;
pub const PFNGLDRAWRANGEELEMENTSPROC = ?extern fn(GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const c_void) void;
pub var glad_glDrawRangeElements: PFNGLDRAWRANGEELEMENTSPROC = null;
pub const PFNGLTEXIMAGE3DPROC = ?extern fn(GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexImage3D: PFNGLTEXIMAGE3DPROC = null;
pub const PFNGLTEXSUBIMAGE3DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, ?*const c_void) void;
pub var glad_glTexSubImage3D: PFNGLTEXSUBIMAGE3DPROC = null;
pub const PFNGLCOPYTEXSUBIMAGE3DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) void;
pub var glad_glCopyTexSubImage3D: PFNGLCOPYTEXSUBIMAGE3DPROC = null;
pub const PFNGLACTIVETEXTUREPROC = ?extern fn(GLenum) void;
pub var glad_glActiveTexture: PFNGLACTIVETEXTUREPROC = null;
pub const PFNGLSAMPLECOVERAGEPROC = ?extern fn(GLfloat, GLboolean) void;
pub var glad_glSampleCoverage: PFNGLSAMPLECOVERAGEPROC = null;
pub const PFNGLCOMPRESSEDTEXIMAGE3DPROC = ?extern fn(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexImage3D: PFNGLCOMPRESSEDTEXIMAGE3DPROC = null;
pub const PFNGLCOMPRESSEDTEXIMAGE2DPROC = ?extern fn(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexImage2D: PFNGLCOMPRESSEDTEXIMAGE2DPROC = null;
pub const PFNGLCOMPRESSEDTEXIMAGE1DPROC = ?extern fn(GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexImage1D: PFNGLCOMPRESSEDTEXIMAGE1DPROC = null;
pub const PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexSubImage3D: PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC = null;
pub const PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC = ?extern fn(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexSubImage2D: PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC = null;
pub const PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC = ?extern fn(GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, ?*const c_void) void;
pub var glad_glCompressedTexSubImage1D: PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC = null;
pub const PFNGLGETCOMPRESSEDTEXIMAGEPROC = ?extern fn(GLenum, GLint, ?*c_void) void;
pub var glad_glGetCompressedTexImage: PFNGLGETCOMPRESSEDTEXIMAGEPROC = null;
pub const PFNGLBLENDFUNCSEPARATEPROC = ?extern fn(GLenum, GLenum, GLenum, GLenum) void;
pub var glad_glBlendFuncSeparate: PFNGLBLENDFUNCSEPARATEPROC = null;
pub const PFNGLMULTIDRAWARRAYSPROC = ?extern fn(GLenum, ?[*]const GLint, ?[*]const GLsizei, GLsizei) void;
pub var glad_glMultiDrawArrays: PFNGLMULTIDRAWARRAYSPROC = null;
pub const PFNGLMULTIDRAWELEMENTSPROC = ?extern fn(GLenum, ?[*]const GLsizei, GLenum, ?[*]const (?*const c_void), GLsizei) void;
pub var glad_glMultiDrawElements: PFNGLMULTIDRAWELEMENTSPROC = null;
pub const PFNGLPOINTPARAMETERFPROC = ?extern fn(GLenum, GLfloat) void;
pub var glad_glPointParameterf: PFNGLPOINTPARAMETERFPROC = null;
pub const PFNGLPOINTPARAMETERFVPROC = ?extern fn(GLenum, ?[*]const GLfloat) void;
pub var glad_glPointParameterfv: PFNGLPOINTPARAMETERFVPROC = null;
pub const PFNGLPOINTPARAMETERIPROC = ?extern fn(GLenum, GLint) void;
pub var glad_glPointParameteri: PFNGLPOINTPARAMETERIPROC = null;
pub const PFNGLPOINTPARAMETERIVPROC = ?extern fn(GLenum, ?[*]const GLint) void;
pub var glad_glPointParameteriv: PFNGLPOINTPARAMETERIVPROC = null;
pub const PFNGLBLENDCOLORPROC = ?extern fn(GLfloat, GLfloat, GLfloat, GLfloat) void;
pub var glad_glBlendColor: PFNGLBLENDCOLORPROC = null;
pub const PFNGLBLENDEQUATIONPROC = ?extern fn(GLenum) void;
pub var glad_glBlendEquation: PFNGLBLENDEQUATIONPROC = null;
pub const PFNGLGENQUERIESPROC = ?extern fn(GLsizei, ?[*]GLuint) void;
pub var glad_glGenQueries: PFNGLGENQUERIESPROC = null;
pub const PFNGLDELETEQUERIESPROC = ?extern fn(GLsizei, ?[*]const GLuint) void;
pub var glad_glDeleteQueries: PFNGLDELETEQUERIESPROC = null;
pub const PFNGLISQUERYPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsQuery: PFNGLISQUERYPROC = null;
pub const PFNGLBEGINQUERYPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glBeginQuery: PFNGLBEGINQUERYPROC = null;
pub const PFNGLENDQUERYPROC = ?extern fn(GLenum) void;
pub var glad_glEndQuery: PFNGLENDQUERYPROC = null;
pub const PFNGLGETQUERYIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetQueryiv: PFNGLGETQUERYIVPROC = null;
pub const PFNGLGETQUERYOBJECTIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetQueryObjectiv: PFNGLGETQUERYOBJECTIVPROC = null;
pub const PFNGLGETQUERYOBJECTUIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLuint) void;
pub var glad_glGetQueryObjectuiv: PFNGLGETQUERYOBJECTUIVPROC = null;
pub const PFNGLBINDBUFFERPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glBindBuffer: PFNGLBINDBUFFERPROC = null;
pub const PFNGLDELETEBUFFERSPROC = ?extern fn(GLsizei, ?*const GLuint) void;
pub var glad_glDeleteBuffers: PFNGLDELETEBUFFERSPROC = null;
pub const PFNGLGENBUFFERSPROC = ?extern fn(GLsizei, ?*GLuint) void;
pub var glad_glGenBuffers: PFNGLGENBUFFERSPROC = null;
pub const PFNGLISBUFFERPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsBuffer: PFNGLISBUFFERPROC = null;
pub const PFNGLBUFFERDATAPROC = ?extern fn(GLenum, GLsizeiptr, ?*const c_void, GLenum) void;
pub var glad_glBufferData: PFNGLBUFFERDATAPROC = null;
pub const PFNGLBUFFERSUBDATAPROC = ?extern fn(GLenum, GLintptr, GLsizeiptr, ?*const c_void) void;
pub var glad_glBufferSubData: PFNGLBUFFERSUBDATAPROC = null;
pub const PFNGLGETBUFFERSUBDATAPROC = ?extern fn(GLenum, GLintptr, GLsizeiptr, ?*c_void) void;
pub var glad_glGetBufferSubData: PFNGLGETBUFFERSUBDATAPROC = null;
pub const PFNGLMAPBUFFERPROC = ?extern fn(GLenum, GLenum) ?*c_void;
pub var glad_glMapBuffer: PFNGLMAPBUFFERPROC = null;
pub const PFNGLUNMAPBUFFERPROC = ?extern fn(GLenum) GLboolean;
pub var glad_glUnmapBuffer: PFNGLUNMAPBUFFERPROC = null;
pub const PFNGLGETBUFFERPARAMETERIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetBufferParameteriv: PFNGLGETBUFFERPARAMETERIVPROC = null;
pub const PFNGLGETBUFFERPOINTERVPROC = ?extern fn(GLenum, GLenum, ?[*](?*c_void)) void;
pub var glad_glGetBufferPointerv: PFNGLGETBUFFERPOINTERVPROC = null;
pub const PFNGLBLENDEQUATIONSEPARATEPROC = ?extern fn(GLenum, GLenum) void;
pub var glad_glBlendEquationSeparate: PFNGLBLENDEQUATIONSEPARATEPROC = null;
pub const PFNGLDRAWBUFFERSPROC = ?extern fn(GLsizei, ?[*]const GLenum) void;
pub var glad_glDrawBuffers: PFNGLDRAWBUFFERSPROC = null;
pub const PFNGLSTENCILOPSEPARATEPROC = ?extern fn(GLenum, GLenum, GLenum, GLenum) void;
pub var glad_glStencilOpSeparate: PFNGLSTENCILOPSEPARATEPROC = null;
pub const PFNGLSTENCILFUNCSEPARATEPROC = ?extern fn(GLenum, GLenum, GLint, GLuint) void;
pub var glad_glStencilFuncSeparate: PFNGLSTENCILFUNCSEPARATEPROC = null;
pub const PFNGLSTENCILMASKSEPARATEPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glStencilMaskSeparate: PFNGLSTENCILMASKSEPARATEPROC = null;
pub const PFNGLATTACHSHADERPROC = ?extern fn(GLuint, GLuint) void;
pub var glad_glAttachShader: PFNGLATTACHSHADERPROC = null;
pub const PFNGLBINDATTRIBLOCATIONPROC = ?extern fn(GLuint, GLuint, ?[*]const GLchar) void;
pub var glad_glBindAttribLocation: PFNGLBINDATTRIBLOCATIONPROC = null;
pub const PFNGLCOMPILESHADERPROC = ?extern fn(GLuint) void;
pub var glad_glCompileShader: PFNGLCOMPILESHADERPROC = null;
pub const PFNGLCREATEPROGRAMPROC = ?extern fn() GLuint;
pub var glad_glCreateProgram: PFNGLCREATEPROGRAMPROC = null;
pub const PFNGLCREATESHADERPROC = ?extern fn(GLenum) GLuint;
pub var glad_glCreateShader: PFNGLCREATESHADERPROC = null;
pub const PFNGLDELETEPROGRAMPROC = ?extern fn(GLuint) void;
pub var glad_glDeleteProgram: PFNGLDELETEPROGRAMPROC = null;
pub const PFNGLDELETESHADERPROC = ?extern fn(GLuint) void;
pub var glad_glDeleteShader: PFNGLDELETESHADERPROC = null;
pub const PFNGLDETACHSHADERPROC = ?extern fn(GLuint, GLuint) void;
pub var glad_glDetachShader: PFNGLDETACHSHADERPROC = null;
pub const PFNGLDISABLEVERTEXATTRIBARRAYPROC = ?extern fn(GLuint) void;
pub var glad_glDisableVertexAttribArray: PFNGLDISABLEVERTEXATTRIBARRAYPROC = null;
pub const PFNGLENABLEVERTEXATTRIBARRAYPROC = ?extern fn(GLuint) void;
pub var glad_glEnableVertexAttribArray: PFNGLENABLEVERTEXATTRIBARRAYPROC = null;
pub const PFNGLGETACTIVEATTRIBPROC = ?extern fn(GLuint, GLuint, GLsizei, ?[*]GLsizei, ?[*]GLint, ?[*]GLenum, ?[*]GLchar) void;
pub var glad_glGetActiveAttrib: PFNGLGETACTIVEATTRIBPROC = null;
pub const PFNGLGETACTIVEUNIFORMPROC = ?extern fn(GLuint, GLuint, GLsizei, ?[*]GLsizei, ?[*]GLint, ?[*]GLenum, ?[*]GLchar) void;
pub var glad_glGetActiveUniform: PFNGLGETACTIVEUNIFORMPROC = null;
pub const PFNGLGETATTACHEDSHADERSPROC = ?extern fn(GLuint, GLsizei, ?[*]GLsizei, ?[*]GLuint) void;
pub var glad_glGetAttachedShaders: PFNGLGETATTACHEDSHADERSPROC = null;
pub const PFNGLGETATTRIBLOCATIONPROC = ?extern fn(GLuint, ?[*]const GLchar) GLint;
pub var glad_glGetAttribLocation: PFNGLGETATTRIBLOCATIONPROC = null;
pub const PFNGLGETPROGRAMIVPROC = ?extern fn(GLuint, GLenum, ?*GLint) void;
pub var glad_glGetProgramiv: PFNGLGETPROGRAMIVPROC = null;
pub const PFNGLGETPROGRAMINFOLOGPROC = ?extern fn(GLuint, GLsizei, ?[*]GLsizei, ?[*]GLchar) void;
pub var glad_glGetProgramInfoLog: PFNGLGETPROGRAMINFOLOGPROC = null;
pub const PFNGLGETSHADERIVPROC = ?extern fn(GLuint, GLenum, ?*GLint) void;
pub var glad_glGetShaderiv: PFNGLGETSHADERIVPROC = null;
pub const PFNGLGETSHADERINFOLOGPROC = ?extern fn(GLuint, GLsizei, ?[*]GLsizei, ?[*]GLchar) void;
pub var glad_glGetShaderInfoLog: PFNGLGETSHADERINFOLOGPROC = null;
pub const PFNGLGETSHADERSOURCEPROC = ?extern fn(GLuint, GLsizei, ?[*]GLsizei, ?[*]GLchar) void;
pub var glad_glGetShaderSource: PFNGLGETSHADERSOURCEPROC = null;
pub const PFNGLGETUNIFORMLOCATIONPROC = ?extern fn(GLuint, ?[*]const GLchar) GLint;
pub var glad_glGetUniformLocation: PFNGLGETUNIFORMLOCATIONPROC = null;
pub const PFNGLGETUNIFORMFVPROC = ?extern fn(GLuint, GLint, ?[*]GLfloat) void;
pub var glad_glGetUniformfv: PFNGLGETUNIFORMFVPROC = null;
pub const PFNGLGETUNIFORMIVPROC = ?extern fn(GLuint, GLint, ?[*]GLint) void;
pub var glad_glGetUniformiv: PFNGLGETUNIFORMIVPROC = null;
pub const PFNGLGETVERTEXATTRIBDVPROC = ?extern fn(GLuint, GLenum, ?[*]GLdouble) void;
pub var glad_glGetVertexAttribdv: PFNGLGETVERTEXATTRIBDVPROC = null;
pub const PFNGLGETVERTEXATTRIBFVPROC = ?extern fn(GLuint, GLenum, ?[*]GLfloat) void;
pub var glad_glGetVertexAttribfv: PFNGLGETVERTEXATTRIBFVPROC = null;
pub const PFNGLGETVERTEXATTRIBIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetVertexAttribiv: PFNGLGETVERTEXATTRIBIVPROC = null;
pub const PFNGLGETVERTEXATTRIBPOINTERVPROC = ?extern fn(GLuint, GLenum, ?[*](?*c_void)) void;
pub var glad_glGetVertexAttribPointerv: PFNGLGETVERTEXATTRIBPOINTERVPROC = null;
pub const PFNGLISPROGRAMPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsProgram: PFNGLISPROGRAMPROC = null;
pub const PFNGLISSHADERPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsShader: PFNGLISSHADERPROC = null;
pub const PFNGLLINKPROGRAMPROC = ?extern fn(GLuint) void;
pub var glad_glLinkProgram: PFNGLLINKPROGRAMPROC = null;
pub const PFNGLSHADERSOURCEPROC = ?extern fn(GLuint, GLsizei, ?[*]const (?[*]const GLchar), ?[*]const GLint) void;
pub var glad_glShaderSource: PFNGLSHADERSOURCEPROC = null;
pub const PFNGLUSEPROGRAMPROC = ?extern fn(GLuint) void;
pub var glad_glUseProgram: PFNGLUSEPROGRAMPROC = null;
pub const PFNGLUNIFORM1FPROC = ?extern fn(GLint, GLfloat) void;
pub var glad_glUniform1f: PFNGLUNIFORM1FPROC = null;
pub const PFNGLUNIFORM2FPROC = ?extern fn(GLint, GLfloat, GLfloat) void;
pub var glad_glUniform2f: PFNGLUNIFORM2FPROC = null;
pub const PFNGLUNIFORM3FPROC = ?extern fn(GLint, GLfloat, GLfloat, GLfloat) void;
pub var glad_glUniform3f: PFNGLUNIFORM3FPROC = null;
pub const PFNGLUNIFORM4FPROC = ?extern fn(GLint, GLfloat, GLfloat, GLfloat, GLfloat) void;
pub var glad_glUniform4f: PFNGLUNIFORM4FPROC = null;
pub const PFNGLUNIFORM1IPROC = ?extern fn(GLint, GLint) void;
pub var glad_glUniform1i: PFNGLUNIFORM1IPROC = null;
pub const PFNGLUNIFORM2IPROC = ?extern fn(GLint, GLint, GLint) void;
pub var glad_glUniform2i: PFNGLUNIFORM2IPROC = null;
pub const PFNGLUNIFORM3IPROC = ?extern fn(GLint, GLint, GLint, GLint) void;
pub var glad_glUniform3i: PFNGLUNIFORM3IPROC = null;
pub const PFNGLUNIFORM4IPROC = ?extern fn(GLint, GLint, GLint, GLint, GLint) void;
pub var glad_glUniform4i: PFNGLUNIFORM4IPROC = null;
pub const PFNGLUNIFORM1FVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLfloat) void;
pub var glad_glUniform1fv: PFNGLUNIFORM1FVPROC = null;
pub const PFNGLUNIFORM2FVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLfloat) void;
pub var glad_glUniform2fv: PFNGLUNIFORM2FVPROC = null;
pub const PFNGLUNIFORM3FVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLfloat) void;
pub var glad_glUniform3fv: PFNGLUNIFORM3FVPROC = null;
pub const PFNGLUNIFORM4FVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLfloat) void;
pub var glad_glUniform4fv: PFNGLUNIFORM4FVPROC = null;
pub const PFNGLUNIFORM1IVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLint) void;
pub var glad_glUniform1iv: PFNGLUNIFORM1IVPROC = null;
pub const PFNGLUNIFORM2IVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLint) void;
pub var glad_glUniform2iv: PFNGLUNIFORM2IVPROC = null;
pub const PFNGLUNIFORM3IVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLint) void;
pub var glad_glUniform3iv: PFNGLUNIFORM3IVPROC = null;
pub const PFNGLUNIFORM4IVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLint) void;
pub var glad_glUniform4iv: PFNGLUNIFORM4IVPROC = null;
pub const PFNGLUNIFORMMATRIX2FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix2fv: PFNGLUNIFORMMATRIX2FVPROC = null;
pub const PFNGLUNIFORMMATRIX3FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix3fv: PFNGLUNIFORMMATRIX3FVPROC = null;
pub const PFNGLUNIFORMMATRIX4FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix4fv: PFNGLUNIFORMMATRIX4FVPROC = null;
pub const PFNGLVALIDATEPROGRAMPROC = ?extern fn(GLuint) void;
pub var glad_glValidateProgram: PFNGLVALIDATEPROGRAMPROC = null;
pub const PFNGLVERTEXATTRIB1DPROC = ?extern fn(GLuint, GLdouble) void;
pub var glad_glVertexAttrib1d: PFNGLVERTEXATTRIB1DPROC = null;
pub const PFNGLVERTEXATTRIB1DVPROC = ?extern fn(GLuint, ?[*]const GLdouble) void;
pub var glad_glVertexAttrib1dv: PFNGLVERTEXATTRIB1DVPROC = null;
pub const PFNGLVERTEXATTRIB1FPROC = ?extern fn(GLuint, GLfloat) void;
pub var glad_glVertexAttrib1f: PFNGLVERTEXATTRIB1FPROC = null;
pub const PFNGLVERTEXATTRIB1FVPROC = ?extern fn(GLuint, ?[*]const GLfloat) void;
pub var glad_glVertexAttrib1fv: PFNGLVERTEXATTRIB1FVPROC = null;
pub const PFNGLVERTEXATTRIB1SPROC = ?extern fn(GLuint, GLshort) void;
pub var glad_glVertexAttrib1s: PFNGLVERTEXATTRIB1SPROC = null;
pub const PFNGLVERTEXATTRIB1SVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttrib1sv: PFNGLVERTEXATTRIB1SVPROC = null;
pub const PFNGLVERTEXATTRIB2DPROC = ?extern fn(GLuint, GLdouble, GLdouble) void;
pub var glad_glVertexAttrib2d: PFNGLVERTEXATTRIB2DPROC = null;
pub const PFNGLVERTEXATTRIB2DVPROC = ?extern fn(GLuint, ?[*]const GLdouble) void;
pub var glad_glVertexAttrib2dv: PFNGLVERTEXATTRIB2DVPROC = null;
pub const PFNGLVERTEXATTRIB2FPROC = ?extern fn(GLuint, GLfloat, GLfloat) void;
pub var glad_glVertexAttrib2f: PFNGLVERTEXATTRIB2FPROC = null;
pub const PFNGLVERTEXATTRIB2FVPROC = ?extern fn(GLuint, ?[*]const GLfloat) void;
pub var glad_glVertexAttrib2fv: PFNGLVERTEXATTRIB2FVPROC = null;
pub const PFNGLVERTEXATTRIB2SPROC = ?extern fn(GLuint, GLshort, GLshort) void;
pub var glad_glVertexAttrib2s: PFNGLVERTEXATTRIB2SPROC = null;
pub const PFNGLVERTEXATTRIB2SVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttrib2sv: PFNGLVERTEXATTRIB2SVPROC = null;
pub const PFNGLVERTEXATTRIB3DPROC = ?extern fn(GLuint, GLdouble, GLdouble, GLdouble) void;
pub var glad_glVertexAttrib3d: PFNGLVERTEXATTRIB3DPROC = null;
pub const PFNGLVERTEXATTRIB3DVPROC = ?extern fn(GLuint, ?[*]const GLdouble) void;
pub var glad_glVertexAttrib3dv: PFNGLVERTEXATTRIB3DVPROC = null;
pub const PFNGLVERTEXATTRIB3FPROC = ?extern fn(GLuint, GLfloat, GLfloat, GLfloat) void;
pub var glad_glVertexAttrib3f: PFNGLVERTEXATTRIB3FPROC = null;
pub const PFNGLVERTEXATTRIB3FVPROC = ?extern fn(GLuint, ?[*]const GLfloat) void;
pub var glad_glVertexAttrib3fv: PFNGLVERTEXATTRIB3FVPROC = null;
pub const PFNGLVERTEXATTRIB3SPROC = ?extern fn(GLuint, GLshort, GLshort, GLshort) void;
pub var glad_glVertexAttrib3s: PFNGLVERTEXATTRIB3SPROC = null;
pub const PFNGLVERTEXATTRIB3SVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttrib3sv: PFNGLVERTEXATTRIB3SVPROC = null;
pub const PFNGLVERTEXATTRIB4NBVPROC = ?extern fn(GLuint, ?[*]const GLbyte) void;
pub var glad_glVertexAttrib4Nbv: PFNGLVERTEXATTRIB4NBVPROC = null;
pub const PFNGLVERTEXATTRIB4NIVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttrib4Niv: PFNGLVERTEXATTRIB4NIVPROC = null;
pub const PFNGLVERTEXATTRIB4NSVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttrib4Nsv: PFNGLVERTEXATTRIB4NSVPROC = null;
pub const PFNGLVERTEXATTRIB4NUBPROC = ?extern fn(GLuint, GLubyte, GLubyte, GLubyte, GLubyte) void;
pub var glad_glVertexAttrib4Nub: PFNGLVERTEXATTRIB4NUBPROC = null;
pub const PFNGLVERTEXATTRIB4NUBVPROC = ?extern fn(GLuint, ?[*]const GLubyte) void;
pub var glad_glVertexAttrib4Nubv: PFNGLVERTEXATTRIB4NUBVPROC = null;
pub const PFNGLVERTEXATTRIB4NUIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttrib4Nuiv: PFNGLVERTEXATTRIB4NUIVPROC = null;
pub const PFNGLVERTEXATTRIB4NUSVPROC = ?extern fn(GLuint, ?[*]const GLushort) void;
pub var glad_glVertexAttrib4Nusv: PFNGLVERTEXATTRIB4NUSVPROC = null;
pub const PFNGLVERTEXATTRIB4BVPROC = ?extern fn(GLuint, ?[*]const GLbyte) void;
pub var glad_glVertexAttrib4bv: PFNGLVERTEXATTRIB4BVPROC = null;
pub const PFNGLVERTEXATTRIB4DPROC = ?extern fn(GLuint, GLdouble, GLdouble, GLdouble, GLdouble) void;
pub var glad_glVertexAttrib4d: PFNGLVERTEXATTRIB4DPROC = null;
pub const PFNGLVERTEXATTRIB4DVPROC = ?extern fn(GLuint, ?[*]const GLdouble) void;
pub var glad_glVertexAttrib4dv: PFNGLVERTEXATTRIB4DVPROC = null;
pub const PFNGLVERTEXATTRIB4FPROC = ?extern fn(GLuint, GLfloat, GLfloat, GLfloat, GLfloat) void;
pub var glad_glVertexAttrib4f: PFNGLVERTEXATTRIB4FPROC = null;
pub const PFNGLVERTEXATTRIB4FVPROC = ?extern fn(GLuint, ?[*]const GLfloat) void;
pub var glad_glVertexAttrib4fv: PFNGLVERTEXATTRIB4FVPROC = null;
pub const PFNGLVERTEXATTRIB4IVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttrib4iv: PFNGLVERTEXATTRIB4IVPROC = null;
pub const PFNGLVERTEXATTRIB4SPROC = ?extern fn(GLuint, GLshort, GLshort, GLshort, GLshort) void;
pub var glad_glVertexAttrib4s: PFNGLVERTEXATTRIB4SPROC = null;
pub const PFNGLVERTEXATTRIB4SVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttrib4sv: PFNGLVERTEXATTRIB4SVPROC = null;
pub const PFNGLVERTEXATTRIB4UBVPROC = ?extern fn(GLuint, ?[*]const GLubyte) void;
pub var glad_glVertexAttrib4ubv: PFNGLVERTEXATTRIB4UBVPROC = null;
pub const PFNGLVERTEXATTRIB4UIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttrib4uiv: PFNGLVERTEXATTRIB4UIVPROC = null;
pub const PFNGLVERTEXATTRIB4USVPROC = ?extern fn(GLuint, ?[*]const GLushort) void;
pub var glad_glVertexAttrib4usv: PFNGLVERTEXATTRIB4USVPROC = null;
pub const PFNGLVERTEXATTRIBPOINTERPROC = ?extern fn(GLuint, GLint, GLenum, GLboolean, GLsizei, ?*const c_void) void;
pub var glad_glVertexAttribPointer: PFNGLVERTEXATTRIBPOINTERPROC = null;
pub const PFNGLUNIFORMMATRIX2X3FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix2x3fv: PFNGLUNIFORMMATRIX2X3FVPROC = null;
pub const PFNGLUNIFORMMATRIX3X2FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix3x2fv: PFNGLUNIFORMMATRIX3X2FVPROC = null;
pub const PFNGLUNIFORMMATRIX2X4FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix2x4fv: PFNGLUNIFORMMATRIX2X4FVPROC = null;
pub const PFNGLUNIFORMMATRIX4X2FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix4x2fv: PFNGLUNIFORMMATRIX4X2FVPROC = null;
pub const PFNGLUNIFORMMATRIX3X4FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix3x4fv: PFNGLUNIFORMMATRIX3X4FVPROC = null;
pub const PFNGLUNIFORMMATRIX4X3FVPROC = ?extern fn(GLint, GLsizei, GLboolean, ?[*]const GLfloat) void;
pub var glad_glUniformMatrix4x3fv: PFNGLUNIFORMMATRIX4X3FVPROC = null;
pub const PFNGLCOLORMASKIPROC = ?extern fn(GLuint, GLboolean, GLboolean, GLboolean, GLboolean) void;
pub var glad_glColorMaski: PFNGLCOLORMASKIPROC = null;
pub const PFNGLGETBOOLEANI_VPROC = ?extern fn(GLenum, GLuint, ?[*]GLboolean) void;
pub var glad_glGetBooleani_v: PFNGLGETBOOLEANI_VPROC = null;
pub const PFNGLGETINTEGERI_VPROC = ?extern fn(GLenum, GLuint, ?[*]GLint) void;
pub var glad_glGetIntegeri_v: PFNGLGETINTEGERI_VPROC = null;
pub const PFNGLENABLEIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glEnablei: PFNGLENABLEIPROC = null;
pub const PFNGLDISABLEIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glDisablei: PFNGLDISABLEIPROC = null;
pub const PFNGLISENABLEDIPROC = ?extern fn(GLenum, GLuint) GLboolean;
pub var glad_glIsEnabledi: PFNGLISENABLEDIPROC = null;
pub const PFNGLBEGINTRANSFORMFEEDBACKPROC = ?extern fn(GLenum) void;
pub var glad_glBeginTransformFeedback: PFNGLBEGINTRANSFORMFEEDBACKPROC = null;
pub const PFNGLENDTRANSFORMFEEDBACKPROC = ?extern fn() void;
pub var glad_glEndTransformFeedback: PFNGLENDTRANSFORMFEEDBACKPROC = null;
pub const PFNGLBINDBUFFERRANGEPROC = ?extern fn(GLenum, GLuint, GLuint, GLintptr, GLsizeiptr) void;
pub var glad_glBindBufferRange: PFNGLBINDBUFFERRANGEPROC = null;
pub const PFNGLBINDBUFFERBASEPROC = ?extern fn(GLenum, GLuint, GLuint) void;
pub var glad_glBindBufferBase: PFNGLBINDBUFFERBASEPROC = null;
pub const PFNGLTRANSFORMFEEDBACKVARYINGSPROC = ?extern fn(GLuint, GLsizei, ?[*]const (?[*]const GLchar), GLenum) void;
pub var glad_glTransformFeedbackVaryings: PFNGLTRANSFORMFEEDBACKVARYINGSPROC = null;
pub const PFNGLGETTRANSFORMFEEDBACKVARYINGPROC = ?extern fn(GLuint, GLuint, GLsizei, ?[*]GLsizei, ?[*]GLsizei, ?[*]GLenum, ?[*]GLchar) void;
pub var glad_glGetTransformFeedbackVarying: PFNGLGETTRANSFORMFEEDBACKVARYINGPROC = null;
pub const PFNGLCLAMPCOLORPROC = ?extern fn(GLenum, GLenum) void;
pub var glad_glClampColor: PFNGLCLAMPCOLORPROC = null;
pub const PFNGLBEGINCONDITIONALRENDERPROC = ?extern fn(GLuint, GLenum) void;
pub var glad_glBeginConditionalRender: PFNGLBEGINCONDITIONALRENDERPROC = null;
pub const PFNGLENDCONDITIONALRENDERPROC = ?extern fn() void;
pub var glad_glEndConditionalRender: PFNGLENDCONDITIONALRENDERPROC = null;
pub const PFNGLVERTEXATTRIBIPOINTERPROC = ?extern fn(GLuint, GLint, GLenum, GLsizei, ?*const c_void) void;
pub var glad_glVertexAttribIPointer: PFNGLVERTEXATTRIBIPOINTERPROC = null;
pub const PFNGLGETVERTEXATTRIBIIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetVertexAttribIiv: PFNGLGETVERTEXATTRIBIIVPROC = null;
pub const PFNGLGETVERTEXATTRIBIUIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLuint) void;
pub var glad_glGetVertexAttribIuiv: PFNGLGETVERTEXATTRIBIUIVPROC = null;
pub const PFNGLVERTEXATTRIBI1IPROC = ?extern fn(GLuint, GLint) void;
pub var glad_glVertexAttribI1i: PFNGLVERTEXATTRIBI1IPROC = null;
pub const PFNGLVERTEXATTRIBI2IPROC = ?extern fn(GLuint, GLint, GLint) void;
pub var glad_glVertexAttribI2i: PFNGLVERTEXATTRIBI2IPROC = null;
pub const PFNGLVERTEXATTRIBI3IPROC = ?extern fn(GLuint, GLint, GLint, GLint) void;
pub var glad_glVertexAttribI3i: PFNGLVERTEXATTRIBI3IPROC = null;
pub const PFNGLVERTEXATTRIBI4IPROC = ?extern fn(GLuint, GLint, GLint, GLint, GLint) void;
pub var glad_glVertexAttribI4i: PFNGLVERTEXATTRIBI4IPROC = null;
pub const PFNGLVERTEXATTRIBI1UIPROC = ?extern fn(GLuint, GLuint) void;
pub var glad_glVertexAttribI1ui: PFNGLVERTEXATTRIBI1UIPROC = null;
pub const PFNGLVERTEXATTRIBI2UIPROC = ?extern fn(GLuint, GLuint, GLuint) void;
pub var glad_glVertexAttribI2ui: PFNGLVERTEXATTRIBI2UIPROC = null;
pub const PFNGLVERTEXATTRIBI3UIPROC = ?extern fn(GLuint, GLuint, GLuint, GLuint) void;
pub var glad_glVertexAttribI3ui: PFNGLVERTEXATTRIBI3UIPROC = null;
pub const PFNGLVERTEXATTRIBI4UIPROC = ?extern fn(GLuint, GLuint, GLuint, GLuint, GLuint) void;
pub var glad_glVertexAttribI4ui: PFNGLVERTEXATTRIBI4UIPROC = null;
pub const PFNGLVERTEXATTRIBI1IVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttribI1iv: PFNGLVERTEXATTRIBI1IVPROC = null;
pub const PFNGLVERTEXATTRIBI2IVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttribI2iv: PFNGLVERTEXATTRIBI2IVPROC = null;
pub const PFNGLVERTEXATTRIBI3IVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttribI3iv: PFNGLVERTEXATTRIBI3IVPROC = null;
pub const PFNGLVERTEXATTRIBI4IVPROC = ?extern fn(GLuint, ?[*]const GLint) void;
pub var glad_glVertexAttribI4iv: PFNGLVERTEXATTRIBI4IVPROC = null;
pub const PFNGLVERTEXATTRIBI1UIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttribI1uiv: PFNGLVERTEXATTRIBI1UIVPROC = null;
pub const PFNGLVERTEXATTRIBI2UIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttribI2uiv: PFNGLVERTEXATTRIBI2UIVPROC = null;
pub const PFNGLVERTEXATTRIBI3UIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttribI3uiv: PFNGLVERTEXATTRIBI3UIVPROC = null;
pub const PFNGLVERTEXATTRIBI4UIVPROC = ?extern fn(GLuint, ?[*]const GLuint) void;
pub var glad_glVertexAttribI4uiv: PFNGLVERTEXATTRIBI4UIVPROC = null;
pub const PFNGLVERTEXATTRIBI4BVPROC = ?extern fn(GLuint, ?[*]const GLbyte) void;
pub var glad_glVertexAttribI4bv: PFNGLVERTEXATTRIBI4BVPROC = null;
pub const PFNGLVERTEXATTRIBI4SVPROC = ?extern fn(GLuint, ?[*]const GLshort) void;
pub var glad_glVertexAttribI4sv: PFNGLVERTEXATTRIBI4SVPROC = null;
pub const PFNGLVERTEXATTRIBI4UBVPROC = ?extern fn(GLuint, ?[*]const GLubyte) void;
pub var glad_glVertexAttribI4ubv: PFNGLVERTEXATTRIBI4UBVPROC = null;
pub const PFNGLVERTEXATTRIBI4USVPROC = ?extern fn(GLuint, ?[*]const GLushort) void;
pub var glad_glVertexAttribI4usv: PFNGLVERTEXATTRIBI4USVPROC = null;
pub const PFNGLGETUNIFORMUIVPROC = ?extern fn(GLuint, GLint, ?[*]GLuint) void;
pub var glad_glGetUniformuiv: PFNGLGETUNIFORMUIVPROC = null;
pub const PFNGLBINDFRAGDATALOCATIONPROC = ?extern fn(GLuint, GLuint, ?[*]const GLchar) void;
pub var glad_glBindFragDataLocation: PFNGLBINDFRAGDATALOCATIONPROC = null;
pub const PFNGLGETFRAGDATALOCATIONPROC = ?extern fn(GLuint, ?[*]const GLchar) GLint;
pub var glad_glGetFragDataLocation: PFNGLGETFRAGDATALOCATIONPROC = null;
pub const PFNGLUNIFORM1UIPROC = ?extern fn(GLint, GLuint) void;
pub var glad_glUniform1ui: PFNGLUNIFORM1UIPROC = null;
pub const PFNGLUNIFORM2UIPROC = ?extern fn(GLint, GLuint, GLuint) void;
pub var glad_glUniform2ui: PFNGLUNIFORM2UIPROC = null;
pub const PFNGLUNIFORM3UIPROC = ?extern fn(GLint, GLuint, GLuint, GLuint) void;
pub var glad_glUniform3ui: PFNGLUNIFORM3UIPROC = null;
pub const PFNGLUNIFORM4UIPROC = ?extern fn(GLint, GLuint, GLuint, GLuint, GLuint) void;
pub var glad_glUniform4ui: PFNGLUNIFORM4UIPROC = null;
pub const PFNGLUNIFORM1UIVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLuint) void;
pub var glad_glUniform1uiv: PFNGLUNIFORM1UIVPROC = null;
pub const PFNGLUNIFORM2UIVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLuint) void;
pub var glad_glUniform2uiv: PFNGLUNIFORM2UIVPROC = null;
pub const PFNGLUNIFORM3UIVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLuint) void;
pub var glad_glUniform3uiv: PFNGLUNIFORM3UIVPROC = null;
pub const PFNGLUNIFORM4UIVPROC = ?extern fn(GLint, GLsizei, ?[*]const GLuint) void;
pub var glad_glUniform4uiv: PFNGLUNIFORM4UIVPROC = null;
pub const PFNGLTEXPARAMETERIIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLint) void;
pub var glad_glTexParameterIiv: PFNGLTEXPARAMETERIIVPROC = null;
pub const PFNGLTEXPARAMETERIUIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLuint) void;
pub var glad_glTexParameterIuiv: PFNGLTEXPARAMETERIUIVPROC = null;
pub const PFNGLGETTEXPARAMETERIIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetTexParameterIiv: PFNGLGETTEXPARAMETERIIVPROC = null;
pub const PFNGLGETTEXPARAMETERIUIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLuint) void;
pub var glad_glGetTexParameterIuiv: PFNGLGETTEXPARAMETERIUIVPROC = null;
pub const PFNGLCLEARBUFFERIVPROC = ?extern fn(GLenum, GLint, ?[*]const GLint) void;
pub var glad_glClearBufferiv: PFNGLCLEARBUFFERIVPROC = null;
pub const PFNGLCLEARBUFFERUIVPROC = ?extern fn(GLenum, GLint, ?[*]const GLuint) void;
pub var glad_glClearBufferuiv: PFNGLCLEARBUFFERUIVPROC = null;
pub const PFNGLCLEARBUFFERFVPROC = ?extern fn(GLenum, GLint, ?[*]const GLfloat) void;
pub var glad_glClearBufferfv: PFNGLCLEARBUFFERFVPROC = null;
pub const PFNGLCLEARBUFFERFIPROC = ?extern fn(GLenum, GLint, GLfloat, GLint) void;
pub var glad_glClearBufferfi: PFNGLCLEARBUFFERFIPROC = null;
pub const PFNGLGETSTRINGIPROC = ?extern fn(GLenum, GLuint) ?[*]const GLubyte;
pub var glad_glGetStringi: PFNGLGETSTRINGIPROC = null;
pub const PFNGLISRENDERBUFFERPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsRenderbuffer: PFNGLISRENDERBUFFERPROC = null;
pub const PFNGLBINDRENDERBUFFERPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glBindRenderbuffer: PFNGLBINDRENDERBUFFERPROC = null;
pub const PFNGLDELETERENDERBUFFERSPROC = ?extern fn(GLsizei, ?[*]const GLuint) void;
pub var glad_glDeleteRenderbuffers: PFNGLDELETERENDERBUFFERSPROC = null;
pub const PFNGLGENRENDERBUFFERSPROC = ?extern fn(GLsizei, ?[*]GLuint) void;
pub var glad_glGenRenderbuffers: PFNGLGENRENDERBUFFERSPROC = null;
pub const PFNGLRENDERBUFFERSTORAGEPROC = ?extern fn(GLenum, GLenum, GLsizei, GLsizei) void;
pub var glad_glRenderbufferStorage: PFNGLRENDERBUFFERSTORAGEPROC = null;
pub const PFNGLGETRENDERBUFFERPARAMETERIVPROC = ?extern fn(GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetRenderbufferParameteriv: PFNGLGETRENDERBUFFERPARAMETERIVPROC = null;
pub const PFNGLISFRAMEBUFFERPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsFramebuffer: PFNGLISFRAMEBUFFERPROC = null;
pub const PFNGLBINDFRAMEBUFFERPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glBindFramebuffer: PFNGLBINDFRAMEBUFFERPROC = null;
pub const PFNGLDELETEFRAMEBUFFERSPROC = ?extern fn(GLsizei, ?[*]const GLuint) void;
pub var glad_glDeleteFramebuffers: PFNGLDELETEFRAMEBUFFERSPROC = null;
pub const PFNGLGENFRAMEBUFFERSPROC = ?extern fn(GLsizei, ?[*]GLuint) void;
pub var glad_glGenFramebuffers: PFNGLGENFRAMEBUFFERSPROC = null;
pub const PFNGLCHECKFRAMEBUFFERSTATUSPROC = ?extern fn(GLenum) GLenum;
pub var glad_glCheckFramebufferStatus: PFNGLCHECKFRAMEBUFFERSTATUSPROC = null;
pub const PFNGLFRAMEBUFFERTEXTURE1DPROC = ?extern fn(GLenum, GLenum, GLenum, GLuint, GLint) void;
pub var glad_glFramebufferTexture1D: PFNGLFRAMEBUFFERTEXTURE1DPROC = null;
pub const PFNGLFRAMEBUFFERTEXTURE2DPROC = ?extern fn(GLenum, GLenum, GLenum, GLuint, GLint) void;
pub var glad_glFramebufferTexture2D: PFNGLFRAMEBUFFERTEXTURE2DPROC = null;
pub const PFNGLFRAMEBUFFERTEXTURE3DPROC = ?extern fn(GLenum, GLenum, GLenum, GLuint, GLint, GLint) void;
pub var glad_glFramebufferTexture3D: PFNGLFRAMEBUFFERTEXTURE3DPROC = null;
pub const PFNGLFRAMEBUFFERRENDERBUFFERPROC = ?extern fn(GLenum, GLenum, GLenum, GLuint) void;
pub var glad_glFramebufferRenderbuffer: PFNGLFRAMEBUFFERRENDERBUFFERPROC = null;
pub const PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = ?extern fn(GLenum, GLenum, GLenum, ?[*]GLint) void;
pub var glad_glGetFramebufferAttachmentParameteriv: PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = null;
pub const PFNGLGENERATEMIPMAPPROC = ?extern fn(GLenum) void;
pub var glad_glGenerateMipmap: PFNGLGENERATEMIPMAPPROC = null;
pub const PFNGLBLITFRAMEBUFFERPROC = ?extern fn(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) void;
pub var glad_glBlitFramebuffer: PFNGLBLITFRAMEBUFFERPROC = null;
pub const PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC = ?extern fn(GLenum, GLsizei, GLenum, GLsizei, GLsizei) void;
pub var glad_glRenderbufferStorageMultisample: PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC = null;
pub const PFNGLFRAMEBUFFERTEXTURELAYERPROC = ?extern fn(GLenum, GLenum, GLuint, GLint, GLint) void;
pub var glad_glFramebufferTextureLayer: PFNGLFRAMEBUFFERTEXTURELAYERPROC = null;
pub const PFNGLMAPBUFFERRANGEPROC = ?extern fn(GLenum, GLintptr, GLsizeiptr, GLbitfield) ?*c_void;
pub var glad_glMapBufferRange: PFNGLMAPBUFFERRANGEPROC = null;
pub const PFNGLFLUSHMAPPEDBUFFERRANGEPROC = ?extern fn(GLenum, GLintptr, GLsizeiptr) void;
pub var glad_glFlushMappedBufferRange: PFNGLFLUSHMAPPEDBUFFERRANGEPROC = null;
pub const PFNGLBINDVERTEXARRAYPROC = ?extern fn(GLuint) void;
pub var glad_glBindVertexArray: PFNGLBINDVERTEXARRAYPROC = null;
pub const PFNGLDELETEVERTEXARRAYSPROC = ?extern fn(GLsizei, ?*const GLuint) void;
pub var glad_glDeleteVertexArrays: PFNGLDELETEVERTEXARRAYSPROC = null;
pub const PFNGLGENVERTEXARRAYSPROC = ?extern fn(GLsizei, ?*GLuint) void;
pub var glad_glGenVertexArrays: PFNGLGENVERTEXARRAYSPROC = null;
pub const PFNGLISVERTEXARRAYPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsVertexArray: PFNGLISVERTEXARRAYPROC = null;
pub const PFNGLDRAWARRAYSINSTANCEDPROC = ?extern fn(GLenum, GLint, GLsizei, GLsizei) void;
pub var glad_glDrawArraysInstanced: PFNGLDRAWARRAYSINSTANCEDPROC = null;
pub const PFNGLDRAWELEMENTSINSTANCEDPROC = ?extern fn(GLenum, GLsizei, GLenum, ?*const c_void, GLsizei) void;
pub var glad_glDrawElementsInstanced: PFNGLDRAWELEMENTSINSTANCEDPROC = null;
pub const PFNGLTEXBUFFERPROC = ?extern fn(GLenum, GLenum, GLuint) void;
pub var glad_glTexBuffer: PFNGLTEXBUFFERPROC = null;
pub const PFNGLPRIMITIVERESTARTINDEXPROC = ?extern fn(GLuint) void;
pub var glad_glPrimitiveRestartIndex: PFNGLPRIMITIVERESTARTINDEXPROC = null;
pub const PFNGLCOPYBUFFERSUBDATAPROC = ?extern fn(GLenum, GLenum, GLintptr, GLintptr, GLsizeiptr) void;
pub var glad_glCopyBufferSubData: PFNGLCOPYBUFFERSUBDATAPROC = null;
pub const PFNGLGETUNIFORMINDICESPROC = ?extern fn(GLuint, GLsizei, ?[*]const (?[*]const GLchar), ?[*]GLuint) void;
pub var glad_glGetUniformIndices: PFNGLGETUNIFORMINDICESPROC = null;
pub const PFNGLGETACTIVEUNIFORMSIVPROC = ?extern fn(GLuint, GLsizei, ?[*]const GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetActiveUniformsiv: PFNGLGETACTIVEUNIFORMSIVPROC = null;
pub const PFNGLGETACTIVEUNIFORMNAMEPROC = ?extern fn(GLuint, GLuint, GLsizei, ?[*]GLsizei, ?[*]GLchar) void;
pub var glad_glGetActiveUniformName: PFNGLGETACTIVEUNIFORMNAMEPROC = null;
pub const PFNGLGETUNIFORMBLOCKINDEXPROC = ?extern fn(GLuint, ?[*]const GLchar) GLuint;
pub var glad_glGetUniformBlockIndex: PFNGLGETUNIFORMBLOCKINDEXPROC = null;
pub const PFNGLGETACTIVEUNIFORMBLOCKIVPROC = ?extern fn(GLuint, GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetActiveUniformBlockiv: PFNGLGETACTIVEUNIFORMBLOCKIVPROC = null;
pub const PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC = ?extern fn(GLuint, GLuint, GLsizei, ?[*]GLsizei, ?[*]GLchar) void;
pub var glad_glGetActiveUniformBlockName: PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC = null;
pub const PFNGLUNIFORMBLOCKBINDINGPROC = ?extern fn(GLuint, GLuint, GLuint) void;
pub var glad_glUniformBlockBinding: PFNGLUNIFORMBLOCKBINDINGPROC = null;
pub const PFNGLDRAWELEMENTSBASEVERTEXPROC = ?extern fn(GLenum, GLsizei, GLenum, ?*const c_void, GLint) void;
pub var glad_glDrawElementsBaseVertex: PFNGLDRAWELEMENTSBASEVERTEXPROC = null;
pub const PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC = ?extern fn(GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const c_void, GLint) void;
pub var glad_glDrawRangeElementsBaseVertex: PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC = null;
pub const PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC = ?extern fn(GLenum, GLsizei, GLenum, ?*const c_void, GLsizei, GLint) void;
pub var glad_glDrawElementsInstancedBaseVertex: PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC = null;
pub const PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC = ?extern fn(GLenum, ?[*]const GLsizei, GLenum, ?[*]const (?*const c_void), GLsizei, ?[*]const GLint) void;
pub var glad_glMultiDrawElementsBaseVertex: PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC = null;
pub const PFNGLPROVOKINGVERTEXPROC = ?extern fn(GLenum) void;
pub var glad_glProvokingVertex: PFNGLPROVOKINGVERTEXPROC = null;
pub const PFNGLFENCESYNCPROC = ?extern fn(GLenum, GLbitfield) GLsync;
pub var glad_glFenceSync: PFNGLFENCESYNCPROC = null;
pub const PFNGLISSYNCPROC = ?extern fn(GLsync) GLboolean;
pub var glad_glIsSync: PFNGLISSYNCPROC = null;
pub const PFNGLDELETESYNCPROC = ?extern fn(GLsync) void;
pub var glad_glDeleteSync: PFNGLDELETESYNCPROC = null;
pub const PFNGLCLIENTWAITSYNCPROC = ?extern fn(GLsync, GLbitfield, GLuint64) GLenum;
pub var glad_glClientWaitSync: PFNGLCLIENTWAITSYNCPROC = null;
pub const PFNGLWAITSYNCPROC = ?extern fn(GLsync, GLbitfield, GLuint64) void;
pub var glad_glWaitSync: PFNGLWAITSYNCPROC = null;
pub const PFNGLGETINTEGER64VPROC = ?extern fn(GLenum, ?[*]GLint64) void;
pub var glad_glGetInteger64v: PFNGLGETINTEGER64VPROC = null;
pub const PFNGLGETSYNCIVPROC = ?extern fn(GLsync, GLenum, GLsizei, ?[*]GLsizei, ?[*]GLint) void;
pub var glad_glGetSynciv: PFNGLGETSYNCIVPROC = null;
pub const PFNGLGETINTEGER64I_VPROC = ?extern fn(GLenum, GLuint, ?[*]GLint64) void;
pub var glad_glGetInteger64i_v: PFNGLGETINTEGER64I_VPROC = null;
pub const PFNGLGETBUFFERPARAMETERI64VPROC = ?extern fn(GLenum, GLenum, ?[*]GLint64) void;
pub var glad_glGetBufferParameteri64v: PFNGLGETBUFFERPARAMETERI64VPROC = null;
pub const PFNGLFRAMEBUFFERTEXTUREPROC = ?extern fn(GLenum, GLenum, GLuint, GLint) void;
pub var glad_glFramebufferTexture: PFNGLFRAMEBUFFERTEXTUREPROC = null;
pub const PFNGLTEXIMAGE2DMULTISAMPLEPROC = ?extern fn(GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLboolean) void;
pub var glad_glTexImage2DMultisample: PFNGLTEXIMAGE2DMULTISAMPLEPROC = null;
pub const PFNGLTEXIMAGE3DMULTISAMPLEPROC = ?extern fn(GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei, GLboolean) void;
pub var glad_glTexImage3DMultisample: PFNGLTEXIMAGE3DMULTISAMPLEPROC = null;
pub const PFNGLGETMULTISAMPLEFVPROC = ?extern fn(GLenum, GLuint, ?[*]GLfloat) void;
pub var glad_glGetMultisamplefv: PFNGLGETMULTISAMPLEFVPROC = null;
pub const PFNGLSAMPLEMASKIPROC = ?extern fn(GLuint, GLbitfield) void;
pub var glad_glSampleMaski: PFNGLSAMPLEMASKIPROC = null;
pub const PFNGLBINDFRAGDATALOCATIONINDEXEDPROC = ?extern fn(GLuint, GLuint, GLuint, ?[*]const GLchar) void;
pub var glad_glBindFragDataLocationIndexed: PFNGLBINDFRAGDATALOCATIONINDEXEDPROC = null;
pub const PFNGLGETFRAGDATAINDEXPROC = ?extern fn(GLuint, ?[*]const GLchar) GLint;
pub var glad_glGetFragDataIndex: PFNGLGETFRAGDATAINDEXPROC = null;
pub const PFNGLGENSAMPLERSPROC = ?extern fn(GLsizei, ?[*]GLuint) void;
pub var glad_glGenSamplers: PFNGLGENSAMPLERSPROC = null;
pub const PFNGLDELETESAMPLERSPROC = ?extern fn(GLsizei, ?[*]const GLuint) void;
pub var glad_glDeleteSamplers: PFNGLDELETESAMPLERSPROC = null;
pub const PFNGLISSAMPLERPROC = ?extern fn(GLuint) GLboolean;
pub var glad_glIsSampler: PFNGLISSAMPLERPROC = null;
pub const PFNGLBINDSAMPLERPROC = ?extern fn(GLuint, GLuint) void;
pub var glad_glBindSampler: PFNGLBINDSAMPLERPROC = null;
pub const PFNGLSAMPLERPARAMETERIPROC = ?extern fn(GLuint, GLenum, GLint) void;
pub var glad_glSamplerParameteri: PFNGLSAMPLERPARAMETERIPROC = null;
pub const PFNGLSAMPLERPARAMETERIVPROC = ?extern fn(GLuint, GLenum, ?[*]const GLint) void;
pub var glad_glSamplerParameteriv: PFNGLSAMPLERPARAMETERIVPROC = null;
pub const PFNGLSAMPLERPARAMETERFPROC = ?extern fn(GLuint, GLenum, GLfloat) void;
pub var glad_glSamplerParameterf: PFNGLSAMPLERPARAMETERFPROC = null;
pub const PFNGLSAMPLERPARAMETERFVPROC = ?extern fn(GLuint, GLenum, ?[*]const GLfloat) void;
pub var glad_glSamplerParameterfv: PFNGLSAMPLERPARAMETERFVPROC = null;
pub const PFNGLSAMPLERPARAMETERIIVPROC = ?extern fn(GLuint, GLenum, ?[*]const GLint) void;
pub var glad_glSamplerParameterIiv: PFNGLSAMPLERPARAMETERIIVPROC = null;
pub const PFNGLSAMPLERPARAMETERIUIVPROC = ?extern fn(GLuint, GLenum, ?[*]const GLuint) void;
pub var glad_glSamplerParameterIuiv: PFNGLSAMPLERPARAMETERIUIVPROC = null;
pub const PFNGLGETSAMPLERPARAMETERIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetSamplerParameteriv: PFNGLGETSAMPLERPARAMETERIVPROC = null;
pub const PFNGLGETSAMPLERPARAMETERIIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLint) void;
pub var glad_glGetSamplerParameterIiv: PFNGLGETSAMPLERPARAMETERIIVPROC = null;
pub const PFNGLGETSAMPLERPARAMETERFVPROC = ?extern fn(GLuint, GLenum, ?[*]GLfloat) void;
pub var glad_glGetSamplerParameterfv: PFNGLGETSAMPLERPARAMETERFVPROC = null;
pub const PFNGLGETSAMPLERPARAMETERIUIVPROC = ?extern fn(GLuint, GLenum, ?[*]GLuint) void;
pub var glad_glGetSamplerParameterIuiv: PFNGLGETSAMPLERPARAMETERIUIVPROC = null;
pub const PFNGLQUERYCOUNTERPROC = ?extern fn(GLuint, GLenum) void;
pub var glad_glQueryCounter: PFNGLQUERYCOUNTERPROC = null;
pub const PFNGLGETQUERYOBJECTI64VPROC = ?extern fn(GLuint, GLenum, ?[*]GLint64) void;
pub var glad_glGetQueryObjecti64v: PFNGLGETQUERYOBJECTI64VPROC = null;
pub const PFNGLGETQUERYOBJECTUI64VPROC = ?extern fn(GLuint, GLenum, ?[*]GLuint64) void;
pub var glad_glGetQueryObjectui64v: PFNGLGETQUERYOBJECTUI64VPROC = null;
pub const PFNGLVERTEXATTRIBDIVISORPROC = ?extern fn(GLuint, GLuint) void;
pub var glad_glVertexAttribDivisor: PFNGLVERTEXATTRIBDIVISORPROC = null;
pub const PFNGLVERTEXATTRIBP1UIPROC = ?extern fn(GLuint, GLenum, GLboolean, GLuint) void;
pub var glad_glVertexAttribP1ui: PFNGLVERTEXATTRIBP1UIPROC = null;
pub const PFNGLVERTEXATTRIBP1UIVPROC = ?extern fn(GLuint, GLenum, GLboolean, ?[*]const GLuint) void;
pub var glad_glVertexAttribP1uiv: PFNGLVERTEXATTRIBP1UIVPROC = null;
pub const PFNGLVERTEXATTRIBP2UIPROC = ?extern fn(GLuint, GLenum, GLboolean, GLuint) void;
pub var glad_glVertexAttribP2ui: PFNGLVERTEXATTRIBP2UIPROC = null;
pub const PFNGLVERTEXATTRIBP2UIVPROC = ?extern fn(GLuint, GLenum, GLboolean, ?[*]const GLuint) void;
pub var glad_glVertexAttribP2uiv: PFNGLVERTEXATTRIBP2UIVPROC = null;
pub const PFNGLVERTEXATTRIBP3UIPROC = ?extern fn(GLuint, GLenum, GLboolean, GLuint) void;
pub var glad_glVertexAttribP3ui: PFNGLVERTEXATTRIBP3UIPROC = null;
pub const PFNGLVERTEXATTRIBP3UIVPROC = ?extern fn(GLuint, GLenum, GLboolean, ?[*]const GLuint) void;
pub var glad_glVertexAttribP3uiv: PFNGLVERTEXATTRIBP3UIVPROC = null;
pub const PFNGLVERTEXATTRIBP4UIPROC = ?extern fn(GLuint, GLenum, GLboolean, GLuint) void;
pub var glad_glVertexAttribP4ui: PFNGLVERTEXATTRIBP4UIPROC = null;
pub const PFNGLVERTEXATTRIBP4UIVPROC = ?extern fn(GLuint, GLenum, GLboolean, ?[*]const GLuint) void;
pub var glad_glVertexAttribP4uiv: PFNGLVERTEXATTRIBP4UIVPROC = null;
pub const PFNGLVERTEXP2UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glVertexP2ui: PFNGLVERTEXP2UIPROC = null;
pub const PFNGLVERTEXP2UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glVertexP2uiv: PFNGLVERTEXP2UIVPROC = null;
pub const PFNGLVERTEXP3UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glVertexP3ui: PFNGLVERTEXP3UIPROC = null;
pub const PFNGLVERTEXP3UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glVertexP3uiv: PFNGLVERTEXP3UIVPROC = null;
pub const PFNGLVERTEXP4UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glVertexP4ui: PFNGLVERTEXP4UIPROC = null;
pub const PFNGLVERTEXP4UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glVertexP4uiv: PFNGLVERTEXP4UIVPROC = null;
pub const PFNGLTEXCOORDP1UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glTexCoordP1ui: PFNGLTEXCOORDP1UIPROC = null;
pub const PFNGLTEXCOORDP1UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glTexCoordP1uiv: PFNGLTEXCOORDP1UIVPROC = null;
pub const PFNGLTEXCOORDP2UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glTexCoordP2ui: PFNGLTEXCOORDP2UIPROC = null;
pub const PFNGLTEXCOORDP2UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glTexCoordP2uiv: PFNGLTEXCOORDP2UIVPROC = null;
pub const PFNGLTEXCOORDP3UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glTexCoordP3ui: PFNGLTEXCOORDP3UIPROC = null;
pub const PFNGLTEXCOORDP3UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glTexCoordP3uiv: PFNGLTEXCOORDP3UIVPROC = null;
pub const PFNGLTEXCOORDP4UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glTexCoordP4ui: PFNGLTEXCOORDP4UIPROC = null;
pub const PFNGLTEXCOORDP4UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glTexCoordP4uiv: PFNGLTEXCOORDP4UIVPROC = null;
pub const PFNGLMULTITEXCOORDP1UIPROC = ?extern fn(GLenum, GLenum, GLuint) void;
pub var glad_glMultiTexCoordP1ui: PFNGLMULTITEXCOORDP1UIPROC = null;
pub const PFNGLMULTITEXCOORDP1UIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLuint) void;
pub var glad_glMultiTexCoordP1uiv: PFNGLMULTITEXCOORDP1UIVPROC = null;
pub const PFNGLMULTITEXCOORDP2UIPROC = ?extern fn(GLenum, GLenum, GLuint) void;
pub var glad_glMultiTexCoordP2ui: PFNGLMULTITEXCOORDP2UIPROC = null;
pub const PFNGLMULTITEXCOORDP2UIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLuint) void;
pub var glad_glMultiTexCoordP2uiv: PFNGLMULTITEXCOORDP2UIVPROC = null;
pub const PFNGLMULTITEXCOORDP3UIPROC = ?extern fn(GLenum, GLenum, GLuint) void;
pub var glad_glMultiTexCoordP3ui: PFNGLMULTITEXCOORDP3UIPROC = null;
pub const PFNGLMULTITEXCOORDP3UIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLuint) void;
pub var glad_glMultiTexCoordP3uiv: PFNGLMULTITEXCOORDP3UIVPROC = null;
pub const PFNGLMULTITEXCOORDP4UIPROC = ?extern fn(GLenum, GLenum, GLuint) void;
pub var glad_glMultiTexCoordP4ui: PFNGLMULTITEXCOORDP4UIPROC = null;
pub const PFNGLMULTITEXCOORDP4UIVPROC = ?extern fn(GLenum, GLenum, ?[*]const GLuint) void;
pub var glad_glMultiTexCoordP4uiv: PFNGLMULTITEXCOORDP4UIVPROC = null;
pub const PFNGLNORMALP3UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glNormalP3ui: PFNGLNORMALP3UIPROC = null;
pub const PFNGLNORMALP3UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glNormalP3uiv: PFNGLNORMALP3UIVPROC = null;
pub const PFNGLCOLORP3UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glColorP3ui: PFNGLCOLORP3UIPROC = null;
pub const PFNGLCOLORP3UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glColorP3uiv: PFNGLCOLORP3UIVPROC = null;
pub const PFNGLCOLORP4UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glColorP4ui: PFNGLCOLORP4UIPROC = null;
pub const PFNGLCOLORP4UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glColorP4uiv: PFNGLCOLORP4UIVPROC = null;
pub const PFNGLSECONDARYCOLORP3UIPROC = ?extern fn(GLenum, GLuint) void;
pub var glad_glSecondaryColorP3ui: PFNGLSECONDARYCOLORP3UIPROC = null;
pub const PFNGLSECONDARYCOLORP3UIVPROC = ?extern fn(GLenum, ?[*]const GLuint) void;
pub var glad_glSecondaryColorP3uiv: PFNGLSECONDARYCOLORP3UIVPROC = null;

// GLFW

pub const GLFWglproc = ?extern fn() void;
pub const GLFWvkproc = ?extern fn() void;
pub const struct_GLFWmonitor = @OpaqueType();
pub const GLFWmonitor = struct_GLFWmonitor;
pub const struct_GLFWwindow = @OpaqueType();
pub const GLFWwindow = struct_GLFWwindow;
pub const struct_GLFWcursor = @OpaqueType();
pub const GLFWcursor = struct_GLFWcursor;
pub const GLFWerrorfun = ?extern fn(c_int, ?[*]const u8) void;
pub const GLFWwindowposfun = ?extern fn(?*GLFWwindow, c_int, c_int) void;
pub const GLFWwindowsizefun = ?extern fn(?*GLFWwindow, c_int, c_int) void;
pub const GLFWwindowclosefun = ?extern fn(?*GLFWwindow) void;
pub const GLFWwindowrefreshfun = ?extern fn(?*GLFWwindow) void;
pub const GLFWwindowfocusfun = ?extern fn(?*GLFWwindow, c_int) void;
pub const GLFWwindowiconifyfun = ?extern fn(?*GLFWwindow, c_int) void;
pub const GLFWframebuffersizefun = ?extern fn(?*GLFWwindow, c_int, c_int) void;
pub const GLFWmousebuttonfun = ?extern fn(?*GLFWwindow, c_int, c_int, c_int) void;
pub const GLFWcursorposfun = ?extern fn(?*GLFWwindow, f64, f64) void;
pub const GLFWcursorenterfun = ?extern fn(?*GLFWwindow, c_int) void;
pub const GLFWscrollfun = ?extern fn(?*GLFWwindow, f64, f64) void;
pub const GLFWkeyfun = ?extern fn(?*GLFWwindow, c_int, c_int, c_int, c_int) void;
pub const GLFWcharfun = ?extern fn(?*GLFWwindow, c_uint) void;
pub const GLFWcharmodsfun = ?extern fn(?*GLFWwindow, c_uint, c_int) void;
pub const GLFWdropfun = ?extern fn(?*GLFWwindow, c_int, ?[*](?[*]const u8)) void;
pub const GLFWmonitorfun = ?extern fn(?*GLFWmonitor, c_int) void;
pub const GLFWjoystickfun = ?extern fn(c_int, c_int) void;
pub const struct_GLFWvidmode = extern struct {
    width: c_int,
    height: c_int,
    redBits: c_int,
    greenBits: c_int,
    blueBits: c_int,
    refreshRate: c_int,
};
pub const GLFWvidmode = struct_GLFWvidmode;
pub const struct_GLFWgammaramp = extern struct {
    red: ?[*]c_ushort,
    green: ?[*]c_ushort,
    blue: ?[*]c_ushort,
    size: c_uint,
};
pub const GLFWgammaramp = struct_GLFWgammaramp;
pub const struct_GLFWimage = extern struct {
    width: c_int,
    height: c_int,
    pixels: ?[*]u8,
};
pub const GLFWimage = struct_GLFWimage;
pub extern fn glfwInit() c_int;
pub extern fn glfwTerminate() void;
pub extern fn glfwGetVersion(major: ?[*]c_int, minor: ?[*]c_int, rev: ?[*]c_int) void;
pub extern fn glfwGetVersionString() ?[*]const u8;
pub extern fn glfwSetErrorCallback(cbfun: GLFWerrorfun) GLFWerrorfun;
pub extern fn glfwGetMonitors(count: ?[*]c_int) ?[*](?*GLFWmonitor);
pub extern fn glfwGetPrimaryMonitor() ?*GLFWmonitor;
pub extern fn glfwGetMonitorPos(monitor: ?*GLFWmonitor, xpos: ?*c_int, ypos: ?*c_int) void;
pub extern fn glfwGetMonitorPhysicalSize(monitor: ?*GLFWmonitor, widthMM: ?[*]c_int, heightMM: ?[*]c_int) void;
pub extern fn glfwGetMonitorName(monitor: ?*GLFWmonitor) ?[*]const u8;
pub extern fn glfwSetMonitorCallback(cbfun: GLFWmonitorfun) GLFWmonitorfun;
pub extern fn glfwGetVideoModes(monitor: ?*GLFWmonitor, count: ?[*]c_int) ?[*]const GLFWvidmode;
pub extern fn glfwGetVideoMode(monitor: ?*GLFWmonitor) ?*const GLFWvidmode;
pub extern fn glfwSetGamma(monitor: ?*GLFWmonitor, gamma: f32) void;
pub extern fn glfwGetGammaRamp(monitor: ?*GLFWmonitor) ?[*]const GLFWgammaramp;
pub extern fn glfwSetGammaRamp(monitor: ?*GLFWmonitor, ramp: ?[*]const GLFWgammaramp) void;
pub extern fn glfwDefaultWindowHints() void;
pub extern fn glfwWindowHint(hint: c_int, value: c_int) void;
pub extern fn glfwCreateWindow(width: c_int, height: c_int, title: ?[*]const u8, monitor: ?*GLFWmonitor, share: ?*GLFWwindow) ?*GLFWwindow;
pub extern fn glfwDestroyWindow(window: ?*GLFWwindow) void;
pub extern fn glfwWindowShouldClose(window: ?*GLFWwindow) c_int;
pub extern fn glfwSetWindowShouldClose(window: ?*GLFWwindow, value: c_int) void;
pub extern fn glfwSetWindowTitle(window: ?*GLFWwindow, title: ?[*]const u8) void;
pub extern fn glfwSetWindowIcon(window: ?*GLFWwindow, count: c_int, images: ?[*]const GLFWimage) void;
pub extern fn glfwGetWindowPos(window: ?*GLFWwindow, xpos: ?*c_int, ypos: ?*c_int) void;
pub extern fn glfwSetWindowPos(window: ?*GLFWwindow, xpos: c_int, ypos: c_int) void;
pub extern fn glfwGetWindowSize(window: ?*GLFWwindow, width: ?[*]c_int, height: ?[*]c_int) void;
pub extern fn glfwSetWindowSizeLimits(window: ?*GLFWwindow, minwidth: c_int, minheight: c_int, maxwidth: c_int, maxheight: c_int) void;
pub extern fn glfwSetWindowAspectRatio(window: ?*GLFWwindow, numer: c_int, denom: c_int) void;
pub extern fn glfwSetWindowSize(window: ?*GLFWwindow, width: c_int, height: c_int) void;
pub extern fn glfwGetFramebufferSize(window: ?*GLFWwindow, width: ?*c_int, height: ?*c_int) void;
pub extern fn glfwGetWindowFrameSize(window: ?*GLFWwindow, left: ?*c_int, top: ?*c_int, right: ?*c_int, bottom: ?*c_int) void;
pub extern fn glfwIconifyWindow(window: ?*GLFWwindow) void;
pub extern fn glfwRestoreWindow(window: ?*GLFWwindow) void;
pub extern fn glfwMaximizeWindow(window: ?*GLFWwindow) void;
pub extern fn glfwShowWindow(window: ?*GLFWwindow) void;
pub extern fn glfwHideWindow(window: ?*GLFWwindow) void;
pub extern fn glfwFocusWindow(window: ?*GLFWwindow) void;
pub extern fn glfwGetWindowMonitor(window: ?*GLFWwindow) ?*GLFWmonitor;
pub extern fn glfwSetWindowMonitor(window: ?*GLFWwindow, monitor: ?*GLFWmonitor, xpos: c_int, ypos: c_int, width: c_int, height: c_int, refreshRate: c_int) void;
pub extern fn glfwGetWindowAttrib(window: ?*GLFWwindow, attrib: c_int) c_int;
pub extern fn glfwSetWindowUserPointer(window: ?*GLFWwindow, pointer: ?*c_void) void;
pub extern fn glfwGetWindowUserPointer(window: ?*GLFWwindow) ?*c_void;
pub extern fn glfwSetWindowPosCallback(window: ?*GLFWwindow, cbfun: GLFWwindowposfun) GLFWwindowposfun;
pub extern fn glfwSetWindowSizeCallback(window: ?*GLFWwindow, cbfun: GLFWwindowsizefun) GLFWwindowsizefun;
pub extern fn glfwSetWindowCloseCallback(window: ?*GLFWwindow, cbfun: GLFWwindowclosefun) GLFWwindowclosefun;
pub extern fn glfwSetWindowRefreshCallback(window: ?*GLFWwindow, cbfun: GLFWwindowrefreshfun) GLFWwindowrefreshfun;
pub extern fn glfwSetWindowFocusCallback(window: ?*GLFWwindow, cbfun: GLFWwindowfocusfun) GLFWwindowfocusfun;
pub extern fn glfwSetWindowIconifyCallback(window: ?*GLFWwindow, cbfun: GLFWwindowiconifyfun) GLFWwindowiconifyfun;
pub extern fn glfwSetFramebufferSizeCallback(window: ?*GLFWwindow, cbfun: GLFWframebuffersizefun) GLFWframebuffersizefun;
pub extern fn glfwPollEvents() void;
pub extern fn glfwWaitEvents() void;
pub extern fn glfwWaitEventsTimeout(timeout: f64) void;
pub extern fn glfwPostEmptyEvent() void;
pub extern fn glfwGetInputMode(window: ?*GLFWwindow, mode: c_int) c_int;
pub extern fn glfwSetInputMode(window: ?*GLFWwindow, mode: c_int, value: c_int) void;
pub extern fn glfwGetKeyName(key: c_int, scancode: c_int) ?[*]const u8;
pub extern fn glfwGetKey(window: ?*GLFWwindow, key: c_int) c_int;
pub extern fn glfwGetMouseButton(window: ?*GLFWwindow, button: c_int) c_int;
pub extern fn glfwGetCursorPos(window: ?*GLFWwindow, xpos: ?*f64, ypos: ?*f64) void;
pub extern fn glfwSetCursorPos(window: ?*GLFWwindow, xpos: f64, ypos: f64) void;
pub extern fn glfwCreateCursor(image: ?*const GLFWimage, xhot: c_int, yhot: c_int) ?*GLFWcursor;
pub extern fn glfwCreateStandardCursor(shape: c_int) ?*GLFWcursor;
pub extern fn glfwDestroyCursor(cursor: ?*GLFWcursor) void;
pub extern fn glfwSetCursor(window: ?*GLFWwindow, cursor: ?*GLFWcursor) void;
pub extern fn glfwSetKeyCallback(window: ?*GLFWwindow, cbfun: GLFWkeyfun) GLFWkeyfun;
pub extern fn glfwSetCharCallback(window: ?*GLFWwindow, cbfun: GLFWcharfun) GLFWcharfun;
pub extern fn glfwSetCharModsCallback(window: ?*GLFWwindow, cbfun: GLFWcharmodsfun) GLFWcharmodsfun;
pub extern fn glfwSetMouseButtonCallback(window: ?*GLFWwindow, cbfun: GLFWmousebuttonfun) GLFWmousebuttonfun;
pub extern fn glfwSetCursorPosCallback(window: ?*GLFWwindow, cbfun: GLFWcursorposfun) GLFWcursorposfun;
pub extern fn glfwSetCursorEnterCallback(window: ?*GLFWwindow, cbfun: GLFWcursorenterfun) GLFWcursorenterfun;
pub extern fn glfwSetScrollCallback(window: ?*GLFWwindow, cbfun: GLFWscrollfun) GLFWscrollfun;
pub extern fn glfwSetDropCallback(window: ?*GLFWwindow, cbfun: GLFWdropfun) GLFWdropfun;
pub extern fn glfwJoystickPresent(joy: c_int) c_int;
pub extern fn glfwGetJoystickAxes(joy: c_int, count: ?[*]c_int) ?[*]const f32;
pub extern fn glfwGetJoystickButtons(joy: c_int, count: ?[*]c_int) ?[*]const u8;
pub extern fn glfwGetJoystickName(joy: c_int) ?[*]const u8;
pub extern fn glfwSetJoystickCallback(cbfun: GLFWjoystickfun) GLFWjoystickfun;
pub extern fn glfwSetClipboardString(window: ?*GLFWwindow, string: ?[*]const u8) void;
pub extern fn glfwGetClipboardString(window: ?*GLFWwindow) ?[*]const u8;
pub extern fn glfwGetTime() f64;
pub extern fn glfwSetTime(time: f64) void;
pub extern fn glfwGetTimerValue() u64;
pub extern fn glfwGetTimerFrequency() u64;
pub extern fn glfwMakeContextCurrent(window: ?*GLFWwindow) void;
pub extern fn glfwGetCurrentContext() ?*GLFWwindow;
pub extern fn glfwSwapBuffers(window: ?*GLFWwindow) void;
pub extern fn glfwSwapInterval(interval: c_int) void;
pub extern fn glfwExtensionSupported(extension: ?[*]const u8) c_int;
pub extern fn glfwGetProcAddress(procname: ?[*]const u8) GLFWglproc;
pub extern fn glfwVulkanSupported() c_int;
pub extern fn glfwGetRequiredInstanceExtensions(count: ?[*]u32) ?[*](?[*]const u8);
pub const GL_DRAW_BUFFER5 = 34858;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const GL_RGBA2 = 32853;
pub inline fn glVertexAttrib4dv(arg0: GLuint, arg1: ?[*]const GLdouble) void {
    return glad_glVertexAttrib4dv.?(arg0, arg1);
}
pub const GLFW_KEY_X = 88;
pub const __INT64_FMTd__ = c"ld";
pub const GL_LINE_STRIP = 3;
pub const GL_HALF_FLOAT = 5131;
pub const GL_RGBA8UI = 36220;
pub const GL_POINT = 6912;
pub const GL_SEPARATE_ATTRIBS = 35981;
pub inline fn glUniform1f(arg0: GLint, arg1: GLfloat) void {
    return glad_glUniform1f.?(arg0, arg1);
}
pub const GL_LESS = 513;
pub inline fn glGetVertexAttribPointerv(arg0: GLuint, arg1: GLenum, arg2: ?[*](?*c_void)) void {
    return glad_glGetVertexAttribPointerv.?(arg0, arg1, arg2);
}
pub const GLFW_KEY_ESCAPE = 256;
pub const GL_TEXTURE29 = 34013;
pub const GL_STENCIL_BACK_REF = 36003;
pub const GL_UNSIGNED_NORMALIZED = 35863;
pub const GLFW_KEY_F17 = 306;
pub const UINTMAX_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const GL_VERSION_3_0 = 1;
pub const INT_LEAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const WINT_MIN = if (@typeId(@typeOf(u)) == @import("builtin").TypeId.Pointer) @ptrCast(0, u) else if (@typeId(@typeOf(u)) == @import("builtin").TypeId.Int) @intToPtr(0, u) else 0(u);
pub const __MMX__ = 1;
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 36051;
pub inline fn glFlushMappedBufferRange(arg0: GLenum, arg1: GLintptr, arg2: GLsizeiptr) void {
    return glad_glFlushMappedBufferRange.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttrib4fv(arg0: GLuint, arg1: ?[*]const GLfloat) void {
    return glad_glVertexAttrib4fv.?(arg0, arg1);
}
pub const INTPTR_MAX = c_long(9223372036854775807);
pub const GLFW_KEY_LEFT_CONTROL = 341;
pub const GLFW_MOUSE_BUTTON_5 = 4;
pub const GL_MAX = 32776;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const GL_BGRA_INTEGER = 36251;
pub const GL_POINT_FADE_THRESHOLD_SIZE = 33064;
pub const GL_BOOL_VEC2 = 35671;
pub inline fn glVertexAttribI4ubv(arg0: GLuint, arg1: ?[*]const GLubyte) void {
    return glad_glVertexAttribI4ubv.?(arg0, arg1);
}
pub const GLFW_AUX_BUFFERS = 135179;
pub const GL_CLIP_DISTANCE6 = 12294;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const GLFW_KEY_R = 82;
pub inline fn glGetQueryObjectui64v(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLuint64) void {
    return glad_glGetQueryObjectui64v.?(arg0, arg1, arg2);
}
pub const __WCHAR_WIDTH__ = 32;
pub const GLFW_KEY_RIGHT_BRACKET = 93;
pub const __USE_MISC = 1;
pub const GL_TEXTURE_COMPARE_MODE = 34892;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const GL_CONTEXT_FLAGS = 33310;
pub const GLFW_KEY_F24 = 313;
pub const GLFW_JOYSTICK_14 = 13;
pub const GL_LINE_SMOOTH = 2848;
pub inline fn glEnable(arg0: GLenum) void {
    return glad_glEnable.?(arg0);
}
pub const GLFW_KEY_CAPS_LOCK = 280;
pub const GL_COMPRESSED_TEXTURE_FORMATS = 34467;
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const PRIi32 = c"i";
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_X = 34069;
pub const GL_COLOR_ATTACHMENT22 = 36086;
pub const GLFW_KEY_KP_MULTIPLY = 332;
pub inline fn glVertexP3uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glVertexP3uiv.?(arg0, arg1);
}
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const GLFW_ALPHA_BITS = 135172;
pub inline fn glUniformMatrix3fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix3fv.?(arg0, arg1, arg2, arg3);
}
pub const GL_COLOR_ATTACHMENT13 = 36077;
pub inline fn glGenerateMipmap(arg0: GLenum) void {
    return glad_glGenerateMipmap.?(arg0);
}
pub const GLFW_KEY_KP_3 = 323;
pub const GLFW_NO_CURRENT_CONTEXT = 65538;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub inline fn glBlendFunc(arg0: GLenum, arg1: GLenum) void {
    return glad_glBlendFunc.?(arg0, arg1);
}
pub inline fn glGetSamplerParameterIiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetSamplerParameterIiv.?(arg0, arg1, arg2);
}
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __USE_POSIX199309 = 1;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const GL_SHADER_TYPE = 35663;
pub const GL_SAMPLES = 32937;
pub const GL_VENDOR = 7936;
pub const __WCHAR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-__WCHAR_MAX, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-__WCHAR_MAX, -1) else (-__WCHAR_MAX)(-1);
pub inline fn glVertexAttrib4ubv(arg0: GLuint, arg1: ?[*]const GLubyte) void {
    return glad_glVertexAttrib4ubv.?(arg0, arg1);
}
pub const GL_TEXTURE_HEIGHT = 4097;
pub const __PTRDIFF_WIDTH__ = 64;
pub const GL_MULTISAMPLE = 32925;
pub inline fn glMapBufferRange(arg0: GLenum, arg1: GLintptr, arg2: GLsizeiptr, arg3: GLbitfield) ?*c_void {
    return glad_glMapBufferRange.?(arg0, arg1, arg2, arg3);
}
pub const GL_UNIFORM_BUFFER = 35345;
pub const GL_STENCIL_INDEX16 = 36169;
pub const GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 33298;
pub inline fn glDrawArrays(arg0: GLenum, arg1: GLint, arg2: GLsizei) void {
    return glad_glDrawArrays.?(arg0, arg1, arg2);
}
pub inline fn glShaderSource(arg0: GLuint, arg1: GLsizei, arg2: ?[*]const (?[*]const GLchar), arg3: ?[*]const GLint) void {
    return glad_glShaderSource.?(arg0, arg1, arg2, arg3);
}
pub const GL_SYNC_GPU_COMMANDS_COMPLETE = 37143;
pub const GL_SAMPLER_1D_ARRAY = 36288;
pub const GL_COLOR_ATTACHMENT19 = 36083;
pub const GLFW_RELEASE_BEHAVIOR_NONE = 217090;
pub const GLFW_SAMPLES = 135181;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub inline fn glBindAttribLocation(arg0: GLuint, arg1: GLuint, arg2: ?[*]const GLchar) void {
    return glad_glBindAttribLocation.?(arg0, arg1, arg2);
}
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const GL_RGBA16F = 34842;
pub const GL_LINE_STRIP_ADJACENCY = 11;
pub const GLFW_JOYSTICK_4 = 3;
pub const __USE_ATFILE = 1;
pub const GL_BUFFER_MAPPED = 35004;
pub inline fn glCreateProgram() GLuint {
    return glad_glCreateProgram.?();
}
pub const GL_UNSIGNED_INT_5_9_9_9_REV = 35902;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const GL_TIMESTAMP = 36392;
pub const __DBL_DIG__ = 15;
pub const GL_FRAMEBUFFER_BINDING = 36006;
pub const PRIXLEAST32 = c"X";
pub inline fn glIsQuery(arg0: GLuint) GLboolean {
    return glad_glIsQuery.?(arg0);
}
pub const GLFW_KEY_F5 = 294;
pub inline fn glDeleteSamplers(arg0: GLsizei, arg1: ?[*]const GLuint) void {
    return glad_glDeleteSamplers.?(arg0, arg1);
}
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = 35394;
pub const _BITS_WCHAR_H = 1;
pub inline fn glDisablei(arg0: GLenum, arg1: GLuint) void {
    return glad_glDisablei.?(arg0, arg1);
}
pub inline fn glFlush() void {
    return glad_glFlush.?();
}
pub inline fn glVertexAttribI2iv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttribI2iv.?(arg0, arg1);
}
pub inline fn glSamplerParameterf(arg0: GLuint, arg1: GLenum, arg2: GLfloat) void {
    return glad_glSamplerParameterf.?(arg0, arg1, arg2);
}
pub const GL_COLOR_ATTACHMENT5 = 36069;
pub inline fn glGetBufferSubData(arg0: GLenum, arg1: GLintptr, arg2: GLsizeiptr, arg3: ?*c_void) void {
    return glad_glGetBufferSubData.?(arg0, arg1, arg2, arg3);
}
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const GL_XOR = 5382;
pub const __VERSION__ = c"4.2.1 Compatible Clang 6.0.1 (tags/RELEASE_601/final)";
pub const GL_STATIC_COPY = 35046;
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __UINT_LEAST8_MAX__ = 255;
pub const GL_BUFFER_ACCESS = 35003;
pub const GL_MAX_VERTEX_UNIFORM_COMPONENTS = 35658;
pub const SCNiLEAST16 = c"hi";
pub const PRIX8 = c"X";
pub const GL_SYNC_FENCE = 37142;
pub const GL_LINE_WIDTH_GRANULARITY = 2851;
pub inline fn glUniform2fv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLfloat) void {
    return glad_glUniform2fv.?(arg0, arg1, arg2);
}
pub const PRIiLEAST16 = c"i";
pub const GL_TIME_ELAPSED = 35007;
pub const __UINT16_MAX__ = 65535;
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 37130;
pub const GL_NOR = 5384;
pub const __SIZEOF_WINT_T__ = 4;
pub inline fn glIsEnabled(arg0: GLenum) GLboolean {
    return glad_glIsEnabled.?(arg0);
}
pub const GL_RGB9_E5 = 35901;
pub inline fn glVertexAttrib1s(arg0: GLuint, arg1: GLshort) void {
    return glad_glVertexAttrib1s.?(arg0, arg1);
}
pub const GLFW_KEY_6 = 54;
pub inline fn glVertexAttribI2i(arg0: GLuint, arg1: GLint, arg2: GLint) void {
    return glad_glVertexAttribI2i.?(arg0, arg1, arg2);
}
pub const GL_MAX_RENDERBUFFER_SIZE = 34024;
pub const __WINT_UNSIGNED__ = 1;
pub inline fn glSamplerParameterIiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]const GLint) void {
    return glad_glSamplerParameterIiv.?(arg0, arg1, arg2);
}
pub const GL_COPY_READ_BUFFER = 36662;
pub const SIG_ATOMIC_MAX = 2147483647;
pub inline fn glUnmapBuffer(arg0: GLenum) GLboolean {
    return glad_glUnmapBuffer.?(arg0);
}
pub const SCNdFAST8 = c"hhd";
pub const GL_VERSION_1_2 = 1;
pub const GL_TEXTURE5 = 33989;
pub const GL_SAMPLER_2D_SHADOW = 35682;
pub const GL_PACK_SKIP_ROWS = 3331;
pub const GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 36182;
pub const GL_COMPRESSED_RG_RGTC2 = 36285;
pub const SCNo8 = c"hho";
pub const GL_MAP_READ_BIT = 1;
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub inline fn glMultiTexCoordP1ui(arg0: GLenum, arg1: GLenum, arg2: GLuint) void {
    return glad_glMultiTexCoordP1ui.?(arg0, arg1, arg2);
}
pub const PRIuLEAST8 = c"u";
pub const GL_DRAW_BUFFER8 = 34861;
pub inline fn glGetTexParameterIuiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLuint) void {
    return glad_glGetTexParameterIuiv.?(arg0, arg1, arg2);
}
pub const GL_POINTS = 0;
pub const GLFW_KEY_O = 79;
pub inline fn glUniform3uiv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLuint) void {
    return glad_glUniform3uiv.?(arg0, arg1, arg2);
}
pub const GL_TEXTURE_CUBE_MAP = 34067;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const GL_BGRA = 32993;
pub const GLFW_EGL_CONTEXT_API = 221186;
pub const __UINTMAX_FMTu__ = c"lu";
pub inline fn glGetTexParameterfv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLfloat) void {
    return glad_glGetTexParameterfv.?(arg0, arg1, arg2);
}
pub const SCNdLEAST32 = c"d";
pub const INT_FAST8_MAX = 127;
pub inline fn glSamplerParameteriv(arg0: GLuint, arg1: GLenum, arg2: ?[*]const GLint) void {
    return glad_glSamplerParameteriv.?(arg0, arg1, arg2);
}
pub const GL_SIGNALED = 37145;
pub const _STDINT_H = 1;
pub const GLFW_KEY_SLASH = 47;
pub const GL_FLOAT_MAT2x4 = 35686;
pub inline fn glGetBufferParameteri64v(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint64) void {
    return glad_glGetBufferParameteri64v.?(arg0, arg1, arg2);
}
pub const GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 33297;
pub const GL_RENDERBUFFER_DEPTH_SIZE = 36180;
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 37133;
pub inline fn glUniform4fv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLfloat) void {
    return glad_glUniform4fv.?(arg0, arg1, arg2);
}
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const GL_STENCIL_BACK_VALUE_MASK = 36004;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const GL_RGBA16 = 32859;
pub const GL_FIXED_ONLY = 35101;
pub inline fn glIsProgram(arg0: GLuint) GLboolean {
    return glad_glIsProgram.?(arg0);
}
pub const __UINTMAX_WIDTH__ = 64;
pub const GL_DRAW_BUFFER6 = 34859;
pub const GL_UNIFORM_BLOCK_DATA_SIZE = 35392;
pub inline fn glVertexAttrib3sv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttrib3sv.?(arg0, arg1);
}
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const SCNuLEAST8 = c"hhu";
pub const GLFW_KEY_Y = 89;
pub inline fn glVertexAttrib4f(arg0: GLuint, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat, arg4: GLfloat) void {
    return glad_glVertexAttrib4f.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_ONE_MINUS_DST_COLOR = 775;
pub const INT_LEAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub const GL_RG32F = 33328;
pub const __INT_FAST16_TYPE__ = short;
pub const GL_AND = 5377;
pub const GL_SAMPLE_COVERAGE = 32928;
pub const PRIoLEAST32 = c"o";
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const GL_SAMPLER_2D = 35678;
pub const GLFW_STEREO = 135180;
pub const GL_POLYGON_MODE = 2880;
pub inline fn glUniform1i(arg0: GLint, arg1: GLint) void {
    return glad_glUniform1i.?(arg0, arg1);
}
pub const GL_COMPRESSED_RGBA = 34030;
pub const GL_RGB16UI = 36215;
pub const GLFW_KEY_F16 = 305;
pub const GLFW_KEY_ENTER = 257;
pub inline fn glDrawBuffer(arg0: GLenum) void {
    return glad_glDrawBuffer.?(arg0);
}
pub const __FD_SETSIZE = 1024;
pub const GL_UNSIGNED_INT_SAMPLER_1D = 36305;
pub const GL_VERSION_3_1 = 1;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const GLFW_IBEAM_CURSOR = 221186;
pub inline fn glSecondaryColorP3uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glSecondaryColorP3uiv.?(arg0, arg1);
}
pub const GLFW_MOUSE_BUTTON_4 = 3;
pub const GL_TEXTURE_CUBE_MAP_SEAMLESS = 34895;
pub const INTMAX_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const GL_SET = 5391;
pub const __SIZEOF_FLOAT128__ = 16;
pub const GL_UNPACK_IMAGE_HEIGHT = 32878;
pub const GLFW_LOSE_CONTEXT_ON_RESET = 200706;
pub const GLFW_NOT_INITIALIZED = 65537;
pub const GL_BOOL_VEC3 = 35672;
pub const GL_CLIP_DISTANCE1 = 12289;
pub inline fn glEnablei(arg0: GLenum, arg1: GLuint) void {
    return glad_glEnablei.?(arg0, arg1);
}
pub const INT_FAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const GLFW_KEY_S = 83;
pub const __DBL_MAX__ = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878;
pub const GLFW_OUT_OF_MEMORY = 65541;
pub const __UINT64_FMTx__ = c"lx";
pub const GL_DOUBLEBUFFER = 3122;
pub const GLFW_KEY_F25 = 314;
pub const GLFW_JOYSTICK_15 = 14;
pub const SCNd8 = c"hhd";
pub const GL_SHADER_SOURCE_LENGTH = 35720;
pub const GL_TEXTURE31 = 34015;
pub inline fn glClearBufferiv(arg0: GLenum, arg1: GLint, arg2: ?[*]const GLint) void {
    return glad_glClearBufferiv.?(arg0, arg1, arg2);
}
pub inline fn glTexCoordP4ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glTexCoordP4ui.?(arg0, arg1);
}
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 34071;
pub const __SLONG32_TYPE = int;
pub const PRIoLEAST8 = c"o";
pub const _DEBUG = 1;
pub const GL_COLOR_ATTACHMENT23 = 36087;
pub const GL_RG = 33319;
pub const __restrict_arr = __restrict;
pub const GL_TEXTURE20 = 34004;
pub const GL_COLOR_ATTACHMENT12 = 36076;
pub const GL_EXTENSIONS = 7939;
pub const GL_TEXTURE11 = 33995;
pub const UINT_FAST8_MAX = 255;
pub const __UINTPTR_WIDTH__ = 64;
pub const GLFW_KEY_KP_0 = 320;
pub const GL_DRAW_BUFFER15 = 34868;
pub inline fn glLineWidth(arg0: GLfloat) void {
    return glad_glLineWidth.?(arg0);
}
pub const GL_COLOR = 6144;
pub const GL_RGB10 = 32850;
pub const GLFW_JOYSTICK_9 = 8;
pub const SCNi8 = c"hhi";
pub const GL_RGBA32UI = 36208;
pub inline fn glBindSampler(arg0: GLuint, arg1: GLuint) void {
    return glad_glBindSampler.?(arg0, arg1);
}
pub const GL_RG_INTEGER = 33320;
pub const GL_COLOR_CLEAR_VALUE = 3106;
pub inline fn glVertexAttrib1fv(arg0: GLuint, arg1: ?[*]const GLfloat) void {
    return glad_glVertexAttrib1fv.?(arg0, arg1);
}
pub const __k8 = 1;
pub const GL_RGB8UI = 36221;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 35958;
pub const GL_RGB16I = 36233;
pub const GL_ZERO = 0;
pub const GL_OR_INVERTED = 5389;
pub inline fn glGetIntegerv(arg0: GLenum, arg1: ?[*]GLint) void {
    return glad_glGetIntegerv.?(arg0, arg1);
}
pub inline fn glVertexAttrib1f(arg0: GLuint, arg1: GLfloat) void {
    return glad_glVertexAttrib1f.?(arg0, arg1);
}
pub inline fn glMapBuffer(arg0: GLenum, arg1: GLenum) ?*c_void {
    return glad_glMapBuffer.?(arg0, arg1);
}
pub const GL_TEXTURE_MIN_FILTER = 10241;
pub const GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 35885;
pub const GL_CCW = 2305;
pub const GL_BUFFER_USAGE = 34661;
pub const GL_MAP_WRITE_BIT = 2;
pub const GL_GEOMETRY_VERTICES_OUT = 35094;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const GL_COLOR_ATTACHMENT18 = 36082;
pub inline fn glFramebufferRenderbuffer(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLuint) void {
    return glad_glFramebufferRenderbuffer.?(arg0, arg1, arg2, arg3);
}
pub inline fn glDeleteBuffers(arg0: GLsizei, arg1: ?*const GLuint) void {
    return glad_glDeleteBuffers.?(arg0, arg1);
}
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const PRIX16 = c"X";
pub const __SIZE_FMTo__ = c"lo";
pub const GL_UNSIGNED_SHORT_4_4_4_4 = 32819;
pub const GLFW_DOUBLEBUFFER = 135184;
pub const __UINT_LEAST32_FMTo__ = c"o";
pub inline fn glCopyTexImage2D(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLint, arg4: GLint, arg5: GLsizei, arg6: GLsizei, arg7: GLint) void {
    return glad_glCopyTexImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}
pub inline fn glTexSubImage3D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLsizei, arg6: GLsizei, arg7: GLsizei, arg8: GLenum, arg9: GLenum, arg10: ?*const c_void) void {
    return glad_glTexSubImage3D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
}
pub const GL_AND_INVERTED = 5380;
pub const GLFW_JOYSTICK_7 = 6;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __FLT_MIN_EXP__ = -125;
pub const GL_TEXTURE_BINDING_RECTANGLE = 34038;
pub const GL_MAX_SAMPLES = 36183;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const GL_UNIFORM_MATRIX_STRIDE = 35389;
pub const GL_MAX_COLOR_ATTACHMENTS = 36063;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const GL_RGB4 = 32847;
pub const INT_LEAST8_MIN = -128;
pub inline fn glGetCompressedTexImage(arg0: GLenum, arg1: GLint, arg2: ?*c_void) void {
    return glad_glGetCompressedTexImage.?(arg0, arg1, arg2);
}
pub const GL_FRONT_LEFT = 1024;
pub const GL_PIXEL_PACK_BUFFER = 35051;
pub inline fn glCopyTexSubImage3D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLint, arg6: GLint, arg7: GLsizei, arg8: GLsizei) void {
    return glad_glCopyTexSubImage3D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
pub inline fn glTransformFeedbackVaryings(arg0: GLuint, arg1: GLsizei, arg2: ?[*]const (?[*]const GLchar), arg3: GLenum) void {
    return glad_glTransformFeedbackVaryings.?(arg0, arg1, arg2, arg3);
}
pub const GLFW_KEY_F6 = 295;
pub inline fn glRenderbufferStorage(arg0: GLenum, arg1: GLenum, arg2: GLsizei, arg3: GLsizei) void {
    return glad_glRenderbufferStorage.?(arg0, arg1, arg2, arg3);
}
pub const INTPTR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __UINT_FAST64_FMTx__ = c"lx";
pub inline fn glBlendEquationSeparate(arg0: GLenum, arg1: GLenum) void {
    return glad_glBlendEquationSeparate.?(arg0, arg1);
}
pub const GL_BLEND = 3042;
pub const GL_STENCIL_BACK_FAIL = 34817;
pub const GLFW_GREEN_BITS = 135170;
pub const GL_DEPTH_FUNC = 2932;
pub const __SIZE_WIDTH__ = 64;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const SCNu8 = c"hhu";
pub const GLFW_NATIVE_CONTEXT_API = 221185;
pub const __INT_MAX__ = 2147483647;
pub inline fn glPointParameteriv(arg0: GLenum, arg1: ?[*]const GLint) void {
    return glad_glPointParameteriv.?(arg0, arg1);
}
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const GL_SAMPLER_3D = 35679;
pub inline fn glBindBufferBase(arg0: GLenum, arg1: GLuint, arg2: GLuint) void {
    return glad_glBindBufferBase.?(arg0, arg1, arg2);
}
pub const GLFW_KEY_DOWN = 264;
pub const __DBL_DENORM_MIN__ = 0.000000;
pub const __clang_major__ = 6;
pub const GLFW_ANY_RELEASE_BEHAVIOR = 0;
pub inline fn glDeleteSync(arg0: GLsync) void {
    return glad_glDeleteSync.?(arg0);
}
pub inline fn glVertexAttribI1ui(arg0: GLuint, arg1: GLuint) void {
    return glad_glVertexAttribI1ui.?(arg0, arg1);
}
pub inline fn glUniform1fv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLfloat) void {
    return glad_glUniform1fv.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttrib4s(arg0: GLuint, arg1: GLshort, arg2: GLshort, arg3: GLshort, arg4: GLshort) void {
    return glad_glVertexAttrib4s.?(arg0, arg1, arg2, arg3, arg4);
}
pub const UINTPTR_MAX = c_ulong(18446744073709551615);
pub const GL_R32F = 33326;
pub const GL_TEXTURE_GREEN_SIZE = 32861;
pub inline fn glGetUniformfv(arg0: GLuint, arg1: GLint, arg2: ?[*]GLfloat) void {
    return glad_glGetUniformfv.?(arg0, arg1, arg2);
}
pub inline fn glDrawElementsBaseVertex(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: ?*const c_void, arg4: GLint) void {
    return glad_glDrawElementsBaseVertex.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_SAMPLER_2D_RECT = 35683;
pub const GLFW_KEY_7 = 55;
pub inline fn glUniform3iv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLint) void {
    return glad_glUniform3iv.?(arg0, arg1, arg2);
}
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __LDBL_HAS_DENORM__ = 1;
pub inline fn glDrawElementsInstanced(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: ?*const c_void, arg4: GLsizei) void {
    return glad_glDrawElementsInstanced.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_VERSION_1_3 = 1;
pub const GL_INVALID_FRAMEBUFFER_OPERATION = 1286;
pub const GL_VERTEX_ARRAY_BINDING = 34229;
pub inline fn glGetMultisamplefv(arg0: GLenum, arg1: GLuint, arg2: ?[*]GLfloat) void {
    return glad_glGetMultisamplefv.?(arg0, arg1, arg2);
}
pub const GL_CONSTANT_COLOR = 32769;
pub inline fn glStencilMaskSeparate(arg0: GLenum, arg1: GLuint) void {
    return glad_glStencilMaskSeparate.?(arg0, arg1);
}
pub const __GLIBC_USE_LIB_EXT2 = 0;
pub const __PRI64_PREFIX = c"l";
pub const __UINT8_FMTu__ = c"hhu";
pub inline fn glColorP3uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glColorP3uiv.?(arg0, arg1);
}
pub const GL_RGB8I = 36239;
pub const GL_SRC1_ALPHA = 34185;
pub const GLFW_KEY_BACKSPACE = 259;
pub const GL_DRAW_BUFFER9 = 34862;
pub const GL_RGBA8_SNORM = 36759;
pub const __SIZE_FMTu__ = c"lu";
pub const GL_BLEND_SRC = 3041;
pub const GLFW_KEY_L = 76;
pub inline fn glUniform2i(arg0: GLint, arg1: GLint, arg2: GLint) void {
    return glad_glUniform2i.?(arg0, arg1, arg2);
}
pub const GL_TRIANGLE_FAN = 6;
pub const GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;
pub const GL_UNSIGNED_INT_VEC4 = 36296;
pub const PRIuLEAST32 = c"u";
pub const GL_COMPRESSED_SRGB_ALPHA = 35913;
pub inline fn glTexCoordP1ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glTexCoordP1ui.?(arg0, arg1);
}
pub const GL_INT_SAMPLER_2D = 36298;
pub inline fn glGetProgramInfoLog(arg0: GLuint, arg1: GLsizei, arg2: ?[*]GLsizei, arg3: ?[*]GLchar) void {
    return glad_glGetProgramInfoLog.?(arg0, arg1, arg2, arg3);
}
pub const GL_TEXTURE_MIN_LOD = 33082;
pub const GL_FLOAT_VEC4 = 35666;
pub const SCNx8 = c"hhx";
pub const GL_CURRENT_QUERY = 34917;
pub const GL_RENDERBUFFER_INTERNAL_FORMAT = 36164;
pub inline fn glGetActiveUniformName(arg0: GLuint, arg1: GLuint, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLchar) void {
    return glad_glGetActiveUniformName.?(arg0, arg1, arg2, arg3, arg4);
}
pub const PRIuLEAST16 = c"u";
pub const GL_BLUE_INTEGER = 36246;
pub inline fn glDisable(arg0: GLenum) void {
    return glad_glDisable.?(arg0);
}
pub const __UINT32_FMTu__ = c"u";
pub const GL_TEXTURE_ALPHA_SIZE = 32863;
pub inline fn glGetUniformIndices(arg0: GLuint, arg1: GLsizei, arg2: ?[*]const (?[*]const GLchar), arg3: ?[*]GLuint) void {
    return glad_glGetUniformIndices.?(arg0, arg1, arg2, arg3);
}
pub const GL_RENDERBUFFER_HEIGHT = 36163;
pub const GL_CULL_FACE = 2884;
pub inline fn glGetQueryiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetQueryiv.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttrib3fv(arg0: GLuint, arg1: ?[*]const GLfloat) void {
    return glad_glVertexAttrib3fv.?(arg0, arg1);
}
pub const GL_R16F = 33325;
pub const GL_GEOMETRY_INPUT_TYPE = 35095;
pub const GL_DRAW_BUFFER7 = 34860;
pub inline fn glValidateProgram(arg0: GLuint) void {
    return glad_glValidateProgram.?(arg0);
}
pub const GL_RGBA4 = 32854;
pub const GLFW_KEY_PERIOD = 46;
pub inline fn glVertexAttrib2dv(arg0: GLuint, arg1: ?[*]const GLdouble) void {
    return glad_glVertexAttrib2dv.?(arg0, arg1);
}
pub const GLFW_KEY_F = 70;
pub const GL_ONE = 1;
pub inline fn glDeleteTextures(arg0: GLsizei, arg1: ?[*]const GLuint) void {
    return glad_glDeleteTextures.?(arg0, arg1);
}
pub const UINT32_MAX = c_uint(4294967295);
pub const __x86_64__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub inline fn glQueryCounter(arg0: GLuint, arg1: GLenum) void {
    return glad_glQueryCounter.?(arg0, arg1);
}
pub const GL_MAX_VERTEX_OUTPUT_COMPONENTS = 37154;
pub const GLFW_KEY_MENU = 348;
pub inline fn glBufferSubData(arg0: GLenum, arg1: GLintptr, arg2: GLsizeiptr, arg3: ?*const c_void) void {
    return glad_glBufferSubData.?(arg0, arg1, arg2, arg3);
}
pub const UINT64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const GLFW_KEY_F15 = 304;
pub const __INT_LEAST16_TYPE__ = short;
pub const GL_VERSION_3_2 = 1;
pub inline fn glGenVertexArrays(arg0: GLsizei, arg1: ?*GLuint) void {
    return glad_glGenVertexArrays.?(arg0, arg1);
}
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __SIZEOF_INT__ = 4;
pub const GL_CLIP_DISTANCE0 = 12288;
pub const INT8_MIN = -128;
pub const GL_OR = 5383;
pub const GLFW_KEY_P = 80;
pub const WCHAR_MAX = __WCHAR_MAX;
pub inline fn glCompressedTexImage2D(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLsizei, arg4: GLsizei, arg5: GLint, arg6: GLsizei, arg7: ?*const c_void) void {
    return glad_glCompressedTexImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}
pub inline fn glGetFragDataLocation(arg0: GLuint, arg1: ?[*]const GLchar) GLint {
    return glad_glGetFragDataLocation.?(arg0, arg1);
}
pub inline fn glVertexAttribI1uiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttribI1uiv.?(arg0, arg1);
}
pub const GLFW_KEY_F22 = 311;
pub const GL_TEXTURE_BUFFER = 35882;
pub const GL_RGBA32F = 34836;
pub const GL_MAX_TEXTURE_BUFFER_SIZE = 35883;
pub const GLFW_JOYSTICK_16 = 15;
pub const __SIZEOF_INT128__ = 16;
pub inline fn glWaitSync(arg0: GLsync, arg1: GLbitfield, arg2: GLuint64) void {
    return glad_glWaitSync.?(arg0, arg1, arg2);
}
pub inline fn glDisableVertexAttribArray(arg0: GLuint) void {
    return glad_glDisableVertexAttribArray.?(arg0);
}
pub const GL_TEXTURE_3D = 32879;
pub inline fn glGetVertexAttribfv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLfloat) void {
    return glad_glGetVertexAttribfv.?(arg0, arg1, arg2);
}
pub const GL_TEXTURE30 = 34014;
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 34073;
pub const GL_ARRAY_BUFFER = 34962;
pub const GL_COLOR_ATTACHMENT24 = 36088;
pub const __glibc_c99_flexarr_available = 1;
pub inline fn glVertexAttribPointer(arg0: GLuint, arg1: GLint, arg2: GLenum, arg3: GLboolean, arg4: GLsizei, arg5: ?*const c_void) void {
    return glad_glVertexAttribPointer.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub const __linux = 1;
pub const GL_TEXTURE21 = 34005;
pub const GL_COLOR_ATTACHMENT15 = 36079;
pub inline fn glVertexAttribI4sv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttribI4sv.?(arg0, arg1);
}
pub const GL_BUFFER_MAP_POINTER = 35005;
pub inline fn glGetTexParameterIiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetTexParameterIiv.?(arg0, arg1, arg2);
}
pub const WCHAR_MIN = __WCHAR_MIN;
pub const GL_TEXTURE10 = 33994;
pub const GL_DEPTH_ATTACHMENT = 36096;
pub const GLFW_KEY_KP_1 = 321;
pub const GL_DRAW_BUFFER14 = 34867;
pub const __clang__ = 1;
pub const GLFW_JOYSTICK_8 = 7;
pub inline fn glUniformMatrix4x2fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix4x2fv.?(arg0, arg1, arg2, arg3);
}
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __UINT64_FMTo__ = c"lo";
pub const GL_PROXY_TEXTURE_3D = 32880;
pub const __ATOMIC_ACQ_REL = 4;
pub const GL_TEXTURE_MAX_LEVEL = 33085;
pub const GL_UNSIGNED_INT_SAMPLER_2D_RECT = 36309;
pub inline fn glStencilFuncSeparate(arg0: GLenum, arg1: GLenum, arg2: GLint, arg3: GLuint) void {
    return glad_glStencilFuncSeparate.?(arg0, arg1, arg2, arg3);
}
pub const GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 33301;
pub inline fn glUniformMatrix4x3fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix4x3fv.?(arg0, arg1, arg2, arg3);
}
pub const SCNxFAST8 = c"hhx";
pub const GL_FUNC_REVERSE_SUBTRACT = 32779;
pub const GL_TEXTURE_SWIZZLE_RGBA = 36422;
pub const GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 36264;
pub const GL_READ_FRAMEBUFFER = 36008;
pub inline fn glMultiDrawElements(arg0: GLenum, arg1: ?[*]const GLsizei, arg2: GLenum, arg3: ?[*]const (?*const c_void), arg4: GLsizei) void {
    return glad_glMultiDrawElements.?(arg0, arg1, arg2, arg3, arg4);
}
pub const UINT_FAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const GL_RG16F = 33327;
pub const GL_INCR = 7682;
pub const __WORDSIZE = 64;
pub const GL_VERTEX_ATTRIB_ARRAY_POINTER = 34373;
pub const GL_BUFFER_ACCESS_FLAGS = 37151;
pub const GL_LINE_WIDTH_RANGE = 2850;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub inline fn glCopyTexSubImage1D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLsizei) void {
    return glad_glCopyTexSubImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub inline fn glCheckFramebufferStatus(arg0: GLenum) GLenum {
    return glad_glCheckFramebufferStatus.?(arg0);
}
pub const GL_CULL_FACE_MODE = 2885;
pub const GLFW_CURSOR = 208897;
pub const GL_TEXTURE_BINDING_1D_ARRAY = 35868;
pub const GLFW_JOYSTICK_6 = 5;
pub const __FLT_HAS_DENORM__ = 1;
pub const GL_INVALID_ENUM = 1280;
pub inline fn glVertexAttribI4uiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttribI4uiv.?(arg0, arg1);
}
pub const GL_NAND = 5390;
pub const GL_COMPARE_REF_TO_TEXTURE = 34894;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const GL_RGB16F = 34843;
pub const __FINITE_MATH_ONLY__ = 0;
pub const GL_RGB5 = 32848;
pub const GL_TEXTURE_SWIZZLE_G = 36419;
pub const GLFW_MAXIMIZED = 131080;
pub inline fn glTexSubImage1D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLsizei, arg4: GLenum, arg5: GLenum, arg6: ?*const c_void) void {
    return glad_glTexSubImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub inline fn glPointParameteri(arg0: GLenum, arg1: GLint) void {
    return glad_glPointParameteri.?(arg0, arg1);
}
pub inline fn glScissor(arg0: GLint, arg1: GLint, arg2: GLsizei, arg3: GLsizei) void {
    return glad_glScissor.?(arg0, arg1, arg2, arg3);
}
pub const GL_MIN = 32775;
pub const GLFW_KEY_F7 = 296;
pub const _STDC_PREDEF_H = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 36048;
pub const GL_DEPTH_COMPONENT16 = 33189;
pub const SCNuLEAST16 = c"hu";
pub inline fn glTexParameterfv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLfloat) void {
    return glad_glTexParameterfv.?(arg0, arg1, arg2);
}
pub const __INT_LEAST32_FMTi__ = c"i";
pub const GL_MAX_DEPTH_TEXTURE_SAMPLES = 37135;
pub const __LDBL_EPSILON__ = 0.000000;
pub const __STDC_UTF_32__ = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const GL_QUERY_COUNTER_BITS = 34916;
pub const GLFW_CONTEXT_VERSION_MINOR = 139267;
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const __SIZEOF_DOUBLE__ = 8;
pub const GL_LEFT = 1030;
pub const GL_REPLACE = 7681;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const GL_BLEND_SRC_RGB = 32969;
pub const GL_LINE_LOOP = 2;
pub inline fn glBindFragDataLocationIndexed(arg0: GLuint, arg1: GLuint, arg2: GLuint, arg3: ?[*]const GLchar) void {
    return glad_glBindFragDataLocationIndexed.?(arg0, arg1, arg2, arg3);
}
pub inline fn glTexCoordP3uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glTexCoordP3uiv.?(arg0, arg1);
}
pub const GL_MAX_VARYING_COMPONENTS = 35659;
pub const GL_DEPTH32F_STENCIL8 = 36013;
pub const __SIZE_FMTX__ = c"lX";
pub const SCNuFAST8 = c"hhu";
pub const __ID_T_TYPE = __U32_TYPE;
pub const GL_DEPTH_CLEAR_VALUE = 2931;
pub const GL_INT_SAMPLER_2D_ARRAY = 36303;
pub const GL_ARRAY_BUFFER_BINDING = 34964;
pub const GLFW_KEY_4 = 52;
pub const _BITS_TYPES_H = 1;
pub const GL_INT_SAMPLER_2D_RECT = 36301;
pub const GL_POINT_SPRITE_COORD_ORIGIN = 36000;
pub const GLFW_OPENGL_COMPAT_PROFILE = 204802;
pub const GL_GREEN = 6404;
pub const GL_CLAMP_TO_EDGE = 33071;
pub inline fn glUniform4f(arg0: GLint, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat, arg4: GLfloat) void {
    return glad_glUniform4f.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glTexCoordP1uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glTexCoordP1uiv.?(arg0, arg1);
}
pub const __DBL_MIN_EXP__ = -1021;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const GL_VERSION_1_0 = 1;
pub inline fn glVertexAttribI4i(arg0: GLuint, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint) void {
    return glad_glVertexAttribI4i.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_MAX_DRAW_BUFFERS = 34852;
pub inline fn glBindFragDataLocation(arg0: GLuint, arg1: GLuint, arg2: ?[*]const GLchar) void {
    return glad_glBindFragDataLocation.?(arg0, arg1, arg2);
}
pub const __PID_T_TYPE = __S32_TYPE;
pub const GL_COLOR_WRITEMASK = 3107;
pub const GL_RG32UI = 33340;
pub inline fn glIsTexture(arg0: GLuint) GLboolean {
    return glad_glIsTexture.?(arg0);
}
pub const GL_VERTEX_SHADER = 35633;
pub const __FLOAT128__ = 1;
pub inline fn glClear(arg0: GLbitfield) void {
    return glad_glClear.?(arg0);
}
pub inline fn glGetFramebufferAttachmentParameteriv(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: ?[*]GLint) void {
    return glad_glGetFramebufferAttachmentParameteriv.?(arg0, arg1, arg2, arg3);
}
pub inline fn glAttachShader(arg0: GLuint, arg1: GLuint) void {
    return glad_glAttachShader.?(arg0, arg1);
}
pub const __SIZEOF_SHORT__ = 2;
pub const GL_FRAGMENT_SHADER = 35632;
pub const __UINT16_FMTX__ = c"hX";
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 35979;
pub const GL_TEXTURE_RED_TYPE = 35856;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const PRIxLEAST8 = c"x";
pub inline fn glVertexAttribIPointer(arg0: GLuint, arg1: GLint, arg2: GLenum, arg3: GLsizei, arg4: ?*const c_void) void {
    return glad_glVertexAttribIPointer.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_FLOAT_MAT3x2 = 35687;
pub const GLFW_KEY_M = 77;
pub inline fn glSamplerParameterfv(arg0: GLuint, arg1: GLenum, arg2: ?[*]const GLfloat) void {
    return glad_glSamplerParameterfv.?(arg0, arg1, arg2);
}
pub const GL_UNIFORM_TYPE = 35383;
pub const GLFW_STENCIL_BITS = 135174;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const GL_RGB_INTEGER = 36248;
pub const GL_SCISSOR_TEST = 3089;
pub const GL_CURRENT_VERTEX_ATTRIB = 34342;
pub const GLFW_VERSION_MINOR = 2;
pub const GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 36054;
pub inline fn glTexImage2D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLsizei, arg4: GLsizei, arg5: GLint, arg6: GLenum, arg7: GLenum, arg8: ?*const c_void) void {
    return glad_glTexImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
pub const GL_QUERY_NO_WAIT = 36372;
pub const GLFW_DISCONNECTED = 262146;
pub const __SCHAR_MAX__ = 127;
pub const __USE_POSIX2 = 1;
pub inline fn glReadBuffer(arg0: GLenum) void {
    return glad_glReadBuffer.?(arg0);
}
pub inline fn glGetInteger64v(arg0: GLenum, arg1: ?[*]GLint64) void {
    return glad_glGetInteger64v.?(arg0, arg1);
}
pub const GLFW_CONTEXT_VERSION_MAJOR = 139266;
pub const GLFW_REFRESH_RATE = 135183;
pub const __USE_XOPEN2K = 1;
pub const __USE_FORTIFY_LEVEL = 0;
pub const GL_AND_REVERSE = 5378;
pub const __ELF__ = 1;
pub const GL_RASTERIZER_DISCARD = 35977;
pub const SCNxLEAST16 = c"hx";
pub const GL_SRGB8 = 35905;
pub const __LDBL_MANT_DIG__ = 64;
pub inline fn glBindBuffer(arg0: GLenum, arg1: GLuint) void {
    return glad_glBindBuffer.?(arg0, arg1);
}
pub const GL_COMPRESSED_RG = 33318;
pub const __USE_XOPEN2K8 = 1;
pub const GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 35657;
pub const GL_DRAW_BUFFER0 = 34853;
pub const GL_MAX_SERVER_WAIT_TIMEOUT = 37137;
pub const INT16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub inline fn glGenBuffers(arg0: GLsizei, arg1: ?*GLuint) void {
    return glad_glGenBuffers.?(arg0, arg1);
}
pub const GL_RENDERBUFFER_BLUE_SIZE = 36178;
pub const PRIoFAST8 = c"o";
pub const GLFW_KEY_G = 71;
pub const __UINT64_FMTX__ = c"lX";
pub const GL_SUBPIXEL_BITS = 3408;
pub inline fn glGetVertexAttribIuiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLuint) void {
    return glad_glGetVertexAttribIuiv.?(arg0, arg1, arg2);
}
pub const __DBL_MANT_DIG__ = 53;
pub const GL_INCR_WRAP = 34055;
pub const GL_UNIFORM_OFFSET = 35387;
pub inline fn glUniformMatrix3x4fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix3x4fv.?(arg0, arg1, arg2, arg3);
}
pub const PRIuFAST8 = c"u";
pub const GL_DEPTH_STENCIL_ATTACHMENT = 33306;
pub const GL_SAMPLER_2D_RECT_SHADOW = 35684;
pub const __UID_T_TYPE = __U32_TYPE;
pub inline fn glClientWaitSync(arg0: GLsync, arg1: GLbitfield, arg2: GLuint64) GLenum {
    return glad_glClientWaitSync.?(arg0, arg1, arg2);
}
pub const GLFW_KEY_F14 = 303;
pub const GL_INT_VEC3 = 35668;
pub inline fn glBindBufferRange(arg0: GLenum, arg1: GLuint, arg2: GLuint, arg3: GLintptr, arg4: GLsizeiptr) void {
    return glad_glBindBufferRange.?(arg0, arg1, arg2, arg3, arg4);
}
pub const SCNiLEAST8 = c"hhi";
pub inline fn glEndQuery(arg0: GLenum) void {
    return glad_glEndQuery.?(arg0);
}
pub const GL_VERSION_3_3 = 1;
pub const __SSE__ = 1;
pub const GL_UPPER_LEFT = 36002;
pub const __SIZEOF_SIZE_T__ = 8;
pub inline fn glSampleMaski(arg0: GLuint, arg1: GLbitfield) void {
    return glad_glSampleMaski.?(arg0, arg1);
}
pub const GLFW_INVALID_ENUM = 65539;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const GL_TRIANGLES = 4;
pub inline fn glGetAttachedShaders(arg0: GLuint, arg1: GLsizei, arg2: ?[*]GLsizei, arg3: ?[*]GLuint) void {
    return glad_glGetAttachedShaders.?(arg0, arg1, arg2, arg3);
}
pub const __PRIPTR_PREFIX = c"l";
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub inline fn glClearBufferfv(arg0: GLenum, arg1: GLint, arg2: ?[*]const GLfloat) void {
    return glad_glClearBufferfv.?(arg0, arg1, arg2);
}
pub inline fn glUniformMatrix2x3fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix2x3fv.?(arg0, arg1, arg2, arg3);
}
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 34975;
pub const PRIo32 = c"o";
pub const GL_CLIP_DISTANCE3 = 12291;
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 37123;
pub const GL_INT_SAMPLER_2D_MULTISAMPLE = 37129;
pub const GLFW_KEY_Q = 81;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub inline fn glIsSampler(arg0: GLuint) GLboolean {
    return glad_glIsSampler.?(arg0);
}
pub const GLFW_KEY_PAGE_DOWN = 267;
pub const GLFW_KEY_F23 = 312;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const PRIo16 = c"o";
pub const __LDBL_MAX__ = inf;
pub const PRIdFAST8 = c"d";
pub const GL_ELEMENT_ARRAY_BUFFER_BINDING = 34965;
pub const GL_FLOAT_MAT2 = 35674;
pub const GL_STENCIL_FAIL = 2964;
pub const GL_RGB5_A1 = 32855;
pub const linux = 1;
pub inline fn glGetAttribLocation(arg0: GLuint, arg1: ?[*]const GLchar) GLint {
    return glad_glGetAttribLocation.?(arg0, arg1);
}
pub const GL_NOOP = 5381;
pub const GL_COLOR_ATTACHMENT25 = 36089;
pub inline fn glBlendColor(arg0: GLfloat, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat) void {
    return glad_glBlendColor.?(arg0, arg1, arg2, arg3);
}
pub const GL_TEXTURE22 = 34006;
pub inline fn glPixelStorei(arg0: GLenum, arg1: GLint) void {
    return glad_glPixelStorei.?(arg0, arg1);
}
pub const GL_COLOR_ATTACHMENT14 = 36078;
pub const __INT16_MAX__ = 32767;
pub const GLFW_VISIBLE = 131076;
pub const GL_STENCIL_PASS_DEPTH_FAIL = 2965;
pub const GLAPI = @"extern";
pub const GL_TEXTURE13 = 33997;
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __WINT_WIDTH__ = 32;
pub const GL_RG8_SNORM = 36757;
pub const GL_DRAW_BUFFER13 = 34866;
pub const GL_TEXTURE_1D_ARRAY = 35864;
pub const SCNdLEAST16 = c"hd";
pub const GL_GREEN_INTEGER = 36245;
pub const __SHRT_MAX__ = 32767;
pub const GL_RGB12 = 32851;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub inline fn glGetInteger64i_v(arg0: GLenum, arg1: GLuint, arg2: ?[*]GLint64) void {
    return glad_glGetInteger64i_v.?(arg0, arg1, arg2);
}
pub const GL_ACTIVE_UNIFORMS = 35718;
pub const SCNd32 = c"d";
pub const __INT32_FMTd__ = c"d";
pub const __INTPTR_WIDTH__ = 64;
pub const GL_MINOR_VERSION = 33308;
pub const GL_PIXEL_PACK_BUFFER_BINDING = 35053;
pub const GL_STENCIL_INDEX1 = 36166;
pub const GL_TEXTURE_SWIZZLE_R = 36418;
pub const __INT_FAST32_TYPE__ = int;
pub inline fn glVertexAttrib1d(arg0: GLuint, arg1: GLdouble) void {
    return glad_glVertexAttrib1d.?(arg0, arg1);
}
pub const _POSIX_SOURCE = 1;
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE = 37124;
pub const GL_MAX_ELEMENTS_VERTICES = 33000;
pub const GLFW_KEY_KP_ADD = 334;
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 35398;
pub const GL_QUERY_BY_REGION_WAIT = 36373;
pub const GL_TEXTURE_COMPARE_FUNC = 34893;
pub const GL_TEXTURE_SHARED_SIZE = 35903;
pub inline fn glVertexAttrib3d(arg0: GLuint, arg1: GLdouble, arg2: GLdouble, arg3: GLdouble) void {
    return glad_glVertexAttrib3d.?(arg0, arg1, arg2, arg3);
}
pub inline fn glStencilMask(arg0: GLuint) void {
    return glad_glStencilMask.?(arg0);
}
pub const GLFW_OPENGL_PROFILE = 139272;
pub const GL_TEXTURE19 = 34003;
pub const GLFW_KEY_KP_8 = 328;
pub const GL_UNPACK_SKIP_ROWS = 3315;
pub const GL_MAX_GEOMETRY_OUTPUT_VERTICES = 36320;
pub const GL_DEPTH_WRITEMASK = 2930;
pub const GL_SYNC_FLAGS = 37141;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const INT_FAST8_MIN = -128;
pub const GLFW_JOYSTICK_1 = 0;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const GLFW_KEY_PAUSE = 284;
pub const GL_READ_FRAMEBUFFER_BINDING = 36010;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const GLFW_KEY_LEFT_SUPER = 343;
pub const _BITS_STDINT_INTN_H = 1;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 35973;
pub inline fn glFenceSync(arg0: GLenum, arg1: GLbitfield) GLsync {
    return glad_glFenceSync.?(arg0, arg1);
}
pub const GL_NO_ERROR = 0;
pub const GL_STENCIL_BACK_PASS_DEPTH_FAIL = 34818;
pub const GL_PIXEL_UNPACK_BUFFER = 35052;
pub const GLFW_KEY_F8 = 297;
pub const __FLT_MIN__ = 0.000000;
pub const GLFW_KEY_NUM_LOCK = 282;
pub const __INT8_FMTd__ = c"hhd";
pub inline fn glTexCoordP2ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glTexCoordP2ui.?(arg0, arg1);
}
pub const GL_RG16UI = 33338;
pub const INT64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const GL_TEXTURE_DEPTH_TYPE = 35862;
pub inline fn glGenTextures(arg0: GLsizei, arg1: ?[*]GLuint) void {
    return glad_glGenTextures.?(arg0, arg1);
}
pub const GL_INVALID_INDEX = 4294967295;
pub const GL_COLOR_ATTACHMENT8 = 36072;
pub const GL_OR_REVERSE = 5387;
pub const GL_PROXY_TEXTURE_RECTANGLE = 34039;
pub inline fn glFramebufferTexture3D(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLuint, arg4: GLint, arg5: GLint) void {
    return glad_glFramebufferTexture3D.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const GL_EQUAL = 514;
pub inline fn glEndConditionalRender() void {
    return glad_glEndConditionalRender.?();
}
pub const GL_UNIFORM_BLOCK_BINDING = 35391;
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const GL_TEXTURE_STENCIL_SIZE = 35057;
pub const PRIdLEAST8 = c"d";
pub inline fn glLogicOp(arg0: GLenum) void {
    return glad_glLogicOp.?(arg0);
}
pub inline fn glMultiTexCoordP4uiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glMultiTexCoordP4uiv.?(arg0, arg1, arg2);
}
pub const GL_UNSIGNED_INT_24_8 = 34042;
pub inline fn glDeleteQueries(arg0: GLsizei, arg1: ?[*]const GLuint) void {
    return glad_glDeleteQueries.?(arg0, arg1);
}
pub const GLFW_KEY_5 = 53;
pub const __SIZE_FMTx__ = c"lx";
pub const GL_FILL = 6914;
pub inline fn glDrawRangeElementsBaseVertex(arg0: GLenum, arg1: GLuint, arg2: GLuint, arg3: GLsizei, arg4: GLenum, arg5: ?*const c_void, arg6: GLint) void {
    return glad_glDrawRangeElementsBaseVertex.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const GL_SAMPLER_BUFFER = 36290;
pub const INT_FAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub inline fn glSamplerParameteri(arg0: GLuint, arg1: GLenum, arg2: GLint) void {
    return glad_glSamplerParameteri.?(arg0, arg1, arg2);
}
pub const GL_VERSION_1_1 = 1;
pub const INT32_MAX = 2147483647;
pub const GL_TEXTURE8 = 33992;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const GL_COLOR_ATTACHMENT2 = 36066;
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 35395;
pub inline fn glGetDoublev(arg0: GLenum, arg1: ?[*]GLdouble) void {
    return glad_glGetDoublev.?(arg0, arg1);
}
pub const GLFW_CURSOR_HIDDEN = 212994;
pub const GL_PACK_ROW_LENGTH = 3330;
pub inline fn glCompressedTexImage3D(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLsizei, arg4: GLsizei, arg5: GLsizei, arg6: GLint, arg7: GLsizei, arg8: ?*const c_void) void {
    return glad_glCompressedTexImage3D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
pub inline fn glFramebufferTextureLayer(arg0: GLenum, arg1: GLenum, arg2: GLuint, arg3: GLint, arg4: GLint) void {
    return glad_glFramebufferTextureLayer.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glVertexAttrib2fv(arg0: GLuint, arg1: ?[*]const GLfloat) void {
    return glad_glVertexAttrib2fv.?(arg0, arg1);
}
pub const GL_DYNAMIC_COPY = 35050;
pub const GL_POLYGON_OFFSET_POINT = 10753;
pub const INT_FAST32_MAX = c_long(9223372036854775807);
pub const __llvm__ = 1;
pub const GL_GEOMETRY_SHADER = 36313;
pub inline fn glDrawElementsInstancedBaseVertex(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: ?*const c_void, arg4: GLsizei, arg5: GLint) void {
    return glad_glDrawElementsInstancedBaseVertex.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub const GLFW_KEY_KP_DECIMAL = 330;
pub inline fn glCompressedTexSubImage1D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLsizei, arg4: GLenum, arg5: GLsizei, arg6: ?*const c_void) void {
    return glad_glCompressedTexSubImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub inline fn glCullFace(arg0: GLenum) void {
    return glad_glCullFace.?(arg0);
}
pub const GL_SYNC_CONDITION = 37139;
pub const GL_MAX_ELEMENTS_INDICES = 33001;
pub const __INT_FAST32_FMTi__ = c"i";
pub const GLFW_KEY_J = 74;
pub inline fn glVertexAttrib1dv(arg0: GLuint, arg1: ?[*]const GLdouble) void {
    return glad_glVertexAttrib1dv.?(arg0, arg1);
}
pub const GL_TEXTURE_DEPTH = 32881;
pub inline fn glVertexAttrib4Nubv(arg0: GLuint, arg1: ?[*]const GLubyte) void {
    return glad_glVertexAttrib4Nubv.?(arg0, arg1);
}
pub const GL_STENCIL_ATTACHMENT = 36128;
pub inline fn glGetTexLevelParameteriv(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: ?[*]GLint) void {
    return glad_glGetTexLevelParameteriv.?(arg0, arg1, arg2, arg3);
}
pub inline fn glUniform4i(arg0: GLint, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint) void {
    return glad_glUniform4i.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const GL_MAX_GEOMETRY_UNIFORM_BLOCKS = 35372;
pub const __UINT32_FMTX__ = c"X";
pub const GL_TEXTURE2 = 33986;
pub inline fn glVertexAttribP4uiv(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: ?[*]const GLuint) void {
    return glad_glVertexAttribP4uiv.?(arg0, arg1, arg2, arg3);
}
pub const GL_UNSIGNED_SHORT_4_4_4_4_REV = 33637;
pub const UINT_LEAST8_MAX = 255;
pub const GL_RGB10_A2 = 32857;
pub const __INT32_MAX__ = 2147483647;
pub const GLFW_NO_WINDOW_CONTEXT = 65546;
pub const GL_DRAW_FRAMEBUFFER = 36009;
pub const GL_SMOOTH_POINT_SIZE_RANGE = 2834;
pub const GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 37132;
pub const GLFW_KEY_INSERT = 260;
pub const GLFW_ACCUM_ALPHA_BITS = 135178;
pub inline fn glClampColor(arg0: GLenum, arg1: GLenum) void {
    return glad_glClampColor.?(arg0, arg1);
}
pub const GL_ANY_SAMPLES_PASSED = 35887;
pub const GL_ACTIVE_TEXTURE = 34016;
pub const GL_BLEND_EQUATION_ALPHA = 34877;
pub const GL_DRAW_BUFFER1 = 34854;
pub inline fn glBeginQuery(arg0: GLenum, arg1: GLuint) void {
    return glad_glBeginQuery.?(arg0, arg1);
}
pub const GL_DYNAMIC_DRAW = 35048;
pub const GL_INVALID_OPERATION = 1282;
pub const GL_BUFFER_MAP_OFFSET = 37153;
pub const GLFW_KEY_D = 68;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const SCNuLEAST32 = c"u";
pub inline fn glGetVertexAttribdv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLdouble) void {
    return glad_glGetVertexAttribdv.?(arg0, arg1, arg2);
}
pub const GL_INT_SAMPLER_1D_ARRAY = 36302;
pub const GL_MAX_TEXTURE_LOD_BIAS = 34045;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const GL_TEXTURE_2D_MULTISAMPLE = 37120;
pub const GL_FRONT_RIGHT = 1025;
pub const PRIdLEAST16 = c"d";
pub const GL_BGR_INTEGER = 36250;
pub const GLFW_KEY_RIGHT_SUPER = 347;
pub const GL_UNSIGNED_INT_SAMPLER_3D = 36307;
pub const GL_ACTIVE_UNIFORM_BLOCKS = 35382;
pub const GL_DEPTH_COMPONENT = 6402;
pub const GL_BLEND_DST_ALPHA = 32970;
pub const GL_RGB32I = 36227;
pub const __SSE2_MATH__ = 1;
pub inline fn glPixelStoref(arg0: GLenum, arg1: GLfloat) void {
    return glad_glPixelStoref.?(arg0, arg1);
}
pub const GL_INT_VEC2 = 35667;
pub inline fn glPrimitiveRestartIndex(arg0: GLuint) void {
    return glad_glPrimitiveRestartIndex.?(arg0);
}
pub const __INT_FAST8_MAX__ = 127;
pub const GL_NEVER = 512;
pub inline fn glBlendFuncSeparate(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLenum) void {
    return glad_glBlendFuncSeparate.?(arg0, arg1, arg2, arg3);
}
pub const GL_FLOAT_MAT4x2 = 35689;
pub const __STDC_IEC_559__ = 1;
pub const __USE_ISOC99 = 1;
pub const GL_MAX_RECTANGLE_TEXTURE_SIZE = 34040;
pub const GLFW_VRESIZE_CURSOR = 221190;
pub inline fn glClearBufferfi(arg0: GLenum, arg1: GLint, arg2: GLfloat, arg3: GLint) void {
    return glad_glClearBufferfi.?(arg0, arg1, arg2, arg3);
}
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const GL_CLIP_DISTANCE2 = 12290;
pub const GL_FRAMEBUFFER_UNDEFINED = 33305;
pub const __UINT64_FMTu__ = c"lu";
pub inline fn glTexCoordP3ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glTexCoordP3ui.?(arg0, arg1);
}
pub const SCNo32 = c"o";
pub const GL_RG32I = 33339;
pub inline fn glMultiTexCoordP3ui(arg0: GLenum, arg1: GLenum, arg2: GLuint) void {
    return glad_glMultiTexCoordP3ui.?(arg0, arg1, arg2);
}
pub const __INTMAX_FMTi__ = c"li";
pub const GL_STREAM_READ = 35041;
pub const GLFW_KEY_F20 = 309;
pub const __GNUC__ = 4;
pub const GLFW_JOYSTICK_10 = 9;
pub const GL_FLOAT_MAT3 = 35675;
pub const GL_STREAM_DRAW = 35040;
pub const GL_LINES_ADJACENCY = 10;
pub const GL_COLOR_ATTACHMENT26 = 36090;
pub const GLFW_API_UNAVAILABLE = 65542;
pub const _POSIX_C_SOURCE = c_long(200809);
pub const GL_POLYGON_OFFSET_UNITS = 10752;
pub const GL_TEXTURE23 = 34007;
pub const GL_READ_ONLY = 35000;
pub const GL_COLOR_ATTACHMENT17 = 36081;
pub inline fn glCompileShader(arg0: GLuint) void {
    return glad_glCompileShader.?(arg0);
}
pub const __DBL_MAX_EXP__ = 1024;
pub const GL_TEXTURE12 = 33996;
pub const GL_UNIFORM_IS_ROW_MAJOR = 35390;
pub inline fn glTexImage1D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLsizei, arg4: GLint, arg5: GLenum, arg6: GLenum, arg7: ?*const c_void) void {
    return glad_glTexImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}
pub const __FLT16_MIN_10_EXP__ = -13;
pub const GL_DRAW_BUFFER12 = 34865;
pub const GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 35976;
pub const GLFW_MOUSE_BUTTON_3 = 2;
pub const GL_SAMPLER_2D_MULTISAMPLE_ARRAY = 37131;
pub inline fn glBeginTransformFeedback(arg0: GLenum) void {
    return glad_glBeginTransformFeedback.?(arg0);
}
pub const WINT_MAX = c_uint(4294967295);
pub const ____gwchar_t_defined = 1;
pub const GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 34922;
pub const UINT_FAST16_MAX = c_ulong(18446744073709551615);
pub const GLFW_RELEASE_BEHAVIOR_FLUSH = 217089;
pub const GL_RGBA16UI = 36214;
pub const GL_UNSIGNED_INT_10F_11F_11F_REV = 35899;
pub const GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = 35068;
pub const __ATOMIC_SEQ_CST = 5;
pub inline fn glMultiDrawElementsBaseVertex(arg0: GLenum, arg1: ?[*]const GLsizei, arg2: GLenum, arg3: ?[*]const (?*const c_void), arg4: GLsizei, arg5: ?[*]const GLint) void {
    return glad_glMultiDrawElementsBaseVertex.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub inline fn glGetUniformuiv(arg0: GLuint, arg1: GLint, arg2: ?[*]GLuint) void {
    return glad_glGetUniformuiv.?(arg0, arg1, arg2);
}
pub const GL_DEPTH_CLAMP = 34383;
pub const GL_STENCIL_TEST = 2960;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const GL_TRUE = 1;
pub const GL_ONE_MINUS_SRC_COLOR = 769;
pub const GL_TEXTURE18 = 34002;
pub const GL_PROGRAM_POINT_SIZE = 34370;
pub const __GNUC_STDC_INLINE__ = 1;
pub const GLFW_KEY_KP_9 = 329;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const GL_COPY_INVERTED = 5388;
pub const GL_BUFFER_MAP_LENGTH = 37152;
pub inline fn glTexParameteri(arg0: GLenum, arg1: GLenum, arg2: GLint) void {
    return glad_glTexParameteri.?(arg0, arg1, arg2);
}
pub const GLFW_MOD_ALT = 4;
pub const __UINT16_FMTo__ = c"ho";
pub const GL_MAX_FRAGMENT_INPUT_COMPONENTS = 37157;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const GLFW_RESIZABLE = 131075;
pub const GL_BACK = 1029;
pub const GL_NICEST = 4354;
pub const __GLIBC_USE_IEC_60559_BFP_EXT = 0;
pub const GL_STENCIL_INDEX8 = 36168;
pub const unix = 1;
pub inline fn glTexParameteriv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLint) void {
    return glad_glTexParameteriv.?(arg0, arg1, arg2);
}
pub const GL_TRIANGLES_ADJACENCY = 12;
pub const GLFW_KEY_8 = 56;
pub const PRId32 = c"d";
pub const GLFW_KEY_F9 = 298;
pub const __FLT_MAX__ = 340282346999999984391321947108527833088.000000;
pub const GL_STENCIL_BACK_WRITEMASK = 36005;
pub const GL_TEXTURE_BINDING_2D = 32873;
pub inline fn glGetTexImage(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLenum, arg4: ?*c_void) void {
    return glad_glGetTexImage.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glVertexP2ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glVertexP2ui.?(arg0, arg1);
}
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const PRIx32 = c"x";
pub inline fn glClearBufferuiv(arg0: GLenum, arg1: GLint, arg2: ?[*]const GLuint) void {
    return glad_glClearBufferuiv.?(arg0, arg1, arg2);
}
pub inline fn glUniform3ui(arg0: GLint, arg1: GLuint, arg2: GLuint, arg3: GLuint) void {
    return glad_glUniform3ui.?(arg0, arg1, arg2, arg3);
}
pub const SCNoFAST8 = c"hho";
pub inline fn glEndTransformFeedback() void {
    return glad_glEndTransformFeedback.?();
}
pub const __ATOMIC_CONSUME = 1;
pub const GL_COLOR_ATTACHMENT9 = 36073;
pub const GL_UNIFORM_ARRAY_STRIDE = 35388;
pub inline fn glUniform1iv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLint) void {
    return glad_glUniform1iv.?(arg0, arg1, arg2);
}
pub const GL_TEXTURE_GREEN_TYPE = 35857;
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 36059;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const GL_RENDERBUFFER_SAMPLES = 36011;
pub const GL_BLEND_DST_RGB = 32968;
pub inline fn glGetSamplerParameteriv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetSamplerParameteriv.?(arg0, arg1, arg2);
}
pub const __attribute_alloc_size__ = params;
pub inline fn glDeleteRenderbuffers(arg0: GLsizei, arg1: ?[*]const GLuint) void {
    return glad_glDeleteRenderbuffers.?(arg0, arg1);
}
pub const PRIxFAST8 = c"x";
pub inline fn glGetFragDataIndex(arg0: GLuint, arg1: ?[*]const GLchar) GLint {
    return glad_glGetFragDataIndex.?(arg0, arg1);
}
pub inline fn glUniform2iv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLint) void {
    return glad_glUniform2iv.?(arg0, arg1, arg2);
}
pub const __INT_LEAST8_MAX__ = 127;
pub inline fn glFramebufferTexture1D(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLuint, arg4: GLint) void {
    return glad_glFramebufferTexture1D.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GLFW_ACCUM_GREEN_BITS = 135176;
pub inline fn glUniform2f(arg0: GLint, arg1: GLfloat, arg2: GLfloat) void {
    return glad_glUniform2f.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttrib4iv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttrib4iv.?(arg0, arg1);
}
pub const GL_UNSIGNED_BYTE_2_3_3_REV = 33634;
pub inline fn glBindVertexArray(arg0: GLuint) void {
    return glad_glBindVertexArray.?(arg0);
}
pub const GLFW_KEY_2 = 50;
pub const GL_SAMPLER_1D = 35677;
pub const GL_RED_INTEGER = 36244;
pub const GL_UNPACK_SKIP_PIXELS = 3316;
pub const GL_CLEAR = 5376;
pub inline fn glVertexP4uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glVertexP4uiv.?(arg0, arg1);
}
pub inline fn glVertexAttrib3s(arg0: GLuint, arg1: GLshort, arg2: GLshort, arg3: GLshort) void {
    return glad_glVertexAttrib3s.?(arg0, arg1, arg2, arg3);
}
pub const INT8_MAX = 127;
pub const GL_TEXTURE9 = 33993;
pub const GL_COLOR_ATTACHMENT3 = 36067;
pub const SCNi32 = c"i";
pub const GL_TEXTURE_BINDING_BUFFER = 35884;
pub const GL_RG8 = 33323;
pub const __PIE__ = 2;
pub inline fn glUniform4iv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLint) void {
    return glad_glUniform4iv.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttrib4Nbv(arg0: GLuint, arg1: ?[*]const GLbyte) void {
    return glad_glVertexAttrib4Nbv.?(arg0, arg1);
}
pub const GLFW_VERSION_REVISION = 1;
pub const GL_MAX_GEOMETRY_INPUT_COMPONENTS = 37155;
pub const SCNu32 = c"u";
pub const GL_UNSIGNED_INT_2_10_10_10_REV = 33640;
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __LP64__ = 1;
pub const GL_UNSIGNED_BYTE = 5121;
pub const GL_RGBA_INTEGER = 36249;
pub const __PTRDIFF_FMTi__ = c"li";
pub const GL_MAX_INTEGER_SAMPLES = 37136;
pub const GL_FLOAT_MAT3x4 = 35688;
pub const GLFW_KEY_K = 75;
pub const _BITS_TYPESIZES_H = 1;
pub const GL_ONE_MINUS_SRC_ALPHA = 771;
pub const GL_MAX_VERTEX_UNIFORM_BLOCKS = 35371;
pub inline fn glGetActiveUniformBlockiv(arg0: GLuint, arg1: GLuint, arg2: GLenum, arg3: ?[*]GLint) void {
    return glad_glGetActiveUniformBlockiv.?(arg0, arg1, arg2, arg3);
}
pub inline fn glBufferData(arg0: GLenum, arg1: GLsizeiptr, arg2: ?*const c_void, arg3: GLenum) void {
    return glad_glBufferData.?(arg0, arg1, arg2, arg3);
}
pub const GLFW_MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1;
pub const GL_VERTEX_PROGRAM_POINT_SIZE = 34370;
pub const GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 33296;
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE = 37121;
pub const GL_LINEAR_MIPMAP_LINEAR = 9987;
pub inline fn glVertexAttribI4bv(arg0: GLuint, arg1: ?[*]const GLbyte) void {
    return glad_glVertexAttribI4bv.?(arg0, arg1);
}
pub const GL_TEXTURE3 = 33987;
pub const GL_RGB32F = 34837;
pub const __INO_T_MATCHES_INO64_T = 1;
pub const INT_LEAST16_MAX = 32767;
pub inline fn glMultiDrawArrays(arg0: GLenum, arg1: ?[*]const GLint, arg2: ?[*]const GLsizei, arg3: GLsizei) void {
    return glad_glMultiDrawArrays.?(arg0, arg1, arg2, arg3);
}
pub const INT_LEAST32_MAX = 2147483647;
pub inline fn glVertexAttribP2ui(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: GLuint) void {
    return glad_glVertexAttribP2ui.?(arg0, arg1, arg2, arg3);
}
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const GL_DEPTH_COMPONENT32 = 33191;
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const GL_SAMPLER_2D_ARRAY = 36289;
pub const GL_R16I = 33331;
pub inline fn glHint(arg0: GLenum, arg1: GLenum) void {
    return glad_glHint.?(arg0, arg1);
}
pub const GL_TEXTURE_INTERNAL_FORMAT = 4099;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const GL_VIEWPORT = 2978;
pub const GL_DRAW_BUFFER2 = 34855;
pub inline fn glFramebufferTexture2D(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLuint, arg4: GLint) void {
    return glad_glFramebufferTexture2D.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glGetString(arg0: GLenum) ?[*]const GLubyte {
    return glad_glGetString.?(arg0);
}
pub const GLFW_KEY_E = 69;
pub const GL_INT_SAMPLER_BUFFER = 36304;
pub inline fn glGenRenderbuffers(arg0: GLsizei, arg1: ?[*]GLuint) void {
    return glad_glGenRenderbuffers.?(arg0, arg1);
}
pub const GLFW_OPENGL_CORE_PROFILE = 204801;
pub const GL_SAMPLER_1D_ARRAY_SHADOW = 36291;
pub const GL_UNSIGNED_INT_VEC3 = 36295;
pub inline fn glStencilOp(arg0: GLenum, arg1: GLenum, arg2: GLenum) void {
    return glad_glStencilOp.?(arg0, arg1, arg2);
}
pub const GL_VERTEX_ATTRIB_ARRAY_INTEGER = 35069;
pub const GL_BUFFER_SIZE = 34660;
pub const __STDC_VERSION__ = c_long(201112);
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const GL_PROXY_TEXTURE_CUBE_MAP = 34075;
pub inline fn glIsBuffer(arg0: GLuint) GLboolean {
    return glad_glIsBuffer.?(arg0);
}
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const PRIoLEAST16 = c"o";
pub const GL_FLOAT_MAT4x3 = 35690;
pub inline fn glGetQueryObjecti64v(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint64) void {
    return glad_glGetQueryObjecti64v.?(arg0, arg1, arg2);
}
pub const __clang_version__ = c"6.0.1 (tags/RELEASE_601/final)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const PRIo8 = c"o";
pub const GL_SMOOTH_POINT_SIZE_GRANULARITY = 2835;
pub const GLFW_KEY_LEFT_ALT = 342;
pub const __INTMAX_FMTd__ = c"ld";
pub const GL_LINE_SMOOTH_HINT = 3154;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const GL_SAMPLE_ALPHA_TO_ONE = 32927;
pub inline fn glGetProgramiv(arg0: GLuint, arg1: GLenum, arg2: ?*GLint) void {
    return glad_glGetProgramiv.?(arg0, arg1, arg2);
}
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const GL_MAX_COMBINED_UNIFORM_BLOCKS = 35374;
pub const GLFW_KEY_RIGHT_SHIFT = 344;
pub const GL_VERTEX_ATTRIB_ARRAY_STRIDE = 34340;
pub inline fn glGenFramebuffers(arg0: GLsizei, arg1: ?[*]GLuint) void {
    return glad_glGenFramebuffers.?(arg0, arg1);
}
pub const GLFW_KEY_F21 = 310;
pub const PRId8 = c"d";
pub const GL_MAJOR_VERSION = 33307;
pub const GLFW_JOYSTICK_11 = 10;
pub const PRIxLEAST32 = c"x";
pub const GLFW_KEY_RIGHT = 262;
pub inline fn glCompressedTexSubImage2D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLsizei, arg5: GLsizei, arg6: GLenum, arg7: GLsizei, arg8: ?*const c_void) void {
    return glad_glCompressedTexSubImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
pub const GL_FRONT_FACE = 2886;
pub const GL_COLOR_ATTACHMENT27 = 36091;
pub const GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 1;
pub inline fn glVertexAttribDivisor(arg0: GLuint, arg1: GLuint) void {
    return glad_glVertexAttribDivisor.?(arg0, arg1);
}
pub const SCNd16 = c"hd";
pub const __ptr_t = [*]void;
pub const GL_TEXTURE24 = 34008;
pub const GL_COLOR_ATTACHMENT16 = 36080;
pub const GLFW_FORMAT_UNAVAILABLE = 65545;
pub const GL_TEXTURE15 = 33999;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const GL_DRAW_BUFFER11 = 34864;
pub const GLFW_MOUSE_BUTTON_2 = 1;
pub inline fn glColorMaski(arg0: GLuint, arg1: GLboolean, arg2: GLboolean, arg3: GLboolean, arg4: GLboolean) void {
    return glad_glColorMaski.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glUniform4ui(arg0: GLint, arg1: GLuint, arg2: GLuint, arg3: GLuint, arg4: GLuint) void {
    return glad_glUniform4ui.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __UINT_FAST8_FMTo__ = c"hho";
pub inline fn glVertexP4ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glVertexP4ui.?(arg0, arg1);
}
pub const GLFW_OPENGL_FORWARD_COMPAT = 139270;
pub inline fn glCopyBufferSubData(arg0: GLenum, arg1: GLenum, arg2: GLintptr, arg3: GLintptr, arg4: GLsizeiptr) void {
    return glad_glCopyBufferSubData.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __INT8_MAX__ = 127;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const GLFW_KEY_LEFT_SHIFT = 340;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const GL_FRAMEBUFFER = 36160;
pub const GLFW_KEY_MINUS = 45;
pub const SCNiFAST8 = c"hhi";
pub const GL_NEAREST_MIPMAP_LINEAR = 9986;
pub const GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16;
pub const _SYS_CDEFS_H = 1;
pub const _ATFILE_SOURCE = 1;
pub const __LDBL_MAX_EXP__ = 16384;
pub const GL_PROXY_TEXTURE_1D = 32867;
pub const GL_SAMPLES_PASSED = 35092;
pub inline fn glVertexAttrib3f(arg0: GLuint, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat) void {
    return glad_glVertexAttrib3f.?(arg0, arg1, arg2, arg3);
}
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const GL_SAMPLER_1D_SHADOW = 35681;
pub const GL_RG8UI = 33336;
pub const __pic__ = 2;
pub const GL_NEAREST = 9728;
pub const GLFW_KEY_KP_6 = 326;
pub const GLFW_DEPTH_BITS = 135173;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __LDBL_DENORM_MIN__ = 0.000000;
pub const GLFW_CONTEXT_RELEASE_BEHAVIOR = 139273;
pub const GLFW_AUTO_ICONIFY = 131078;
pub const GLFW_JOYSTICK_3 = 2;
pub const GL_SAMPLER_2D_ARRAY_SHADOW = 36292;
pub const GL_RENDERBUFFER_RED_SIZE = 36176;
pub const __INT64_C_SUFFIX__ = L;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const PRIx8 = c"x";
pub inline fn glTexImage2DMultisample(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: GLsizei, arg4: GLsizei, arg5: GLboolean) void {
    return glad_glTexImage2DMultisample.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub const GL_UNSIGNED_BYTE_3_3_2 = 32818;
pub const PRIu32 = c"u";
pub const GL_COPY = 5379;
pub inline fn glPointParameterf(arg0: GLenum, arg1: GLfloat) void {
    return glad_glPointParameterf.?(arg0, arg1);
}
pub inline fn glVertexAttrib4Nsv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttrib4Nsv.?(arg0, arg1);
}
pub const GL_TEXTURE_BORDER_COLOR = 4100;
pub const GLFW_KEY_9 = 57;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const SCNoLEAST8 = c"hho";
pub inline fn glReadPixels(arg0: GLint, arg1: GLint, arg2: GLsizei, arg3: GLsizei, arg4: GLenum, arg5: GLenum, arg6: ?*c_void) void {
    return glad_glReadPixels.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const GL_DYNAMIC_READ = 35049;
pub const GL_DST_COLOR = 774;
pub const GL_TIMEOUT_IGNORED = 18446744073709551615;
pub inline fn glVertexAttribP3ui(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: GLuint) void {
    return glad_glVertexAttribP3ui.?(arg0, arg1, arg2, arg3);
}
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const GLFW_KEY_UP = 265;
pub const GLFW_KEY_KP_DIVIDE = 331;
pub const GL_PROXY_TEXTURE_2D_ARRAY = 35867;
pub const __ATOMIC_ACQUIRE = 2;
pub const GL_ONE_MINUS_SRC1_COLOR = 35066;
pub const GL_READ_WRITE = 35002;
pub const SCNoLEAST16 = c"ho";
pub const __FLT16_HAS_DENORM__ = 1;
pub const GLFW_OPENGL_ES_API = 196610;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const GL_SYNC_STATUS = 37140;
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub inline fn glGetActiveUniformBlockName(arg0: GLuint, arg1: GLuint, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLchar) void {
    return glad_glGetActiveUniformBlockName.?(arg0, arg1, arg2, arg3, arg4);
}
pub inline fn glTexBuffer(arg0: GLenum, arg1: GLenum, arg2: GLuint) void {
    return glad_glTexBuffer.?(arg0, arg1, arg2);
}
pub const GL_INVERT = 5386;
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 35968;
pub const UINT_LEAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __UINT8_FMTo__ = c"hho";
pub const GL_RGB16_SNORM = 36762;
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const GL_LINES = 1;
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const GLFW_KEY_3 = 51;
pub const GLFW_BLUE_BITS = 135171;
pub const UINT8_MAX = 255;
pub inline fn glBindTexture(arg0: GLenum, arg1: GLuint) void {
    return glad_glBindTexture.?(arg0, arg1);
}
pub inline fn glSampleCoverage(arg0: GLfloat, arg1: GLboolean) void {
    return glad_glSampleCoverage.?(arg0, arg1);
}
pub const GLFW_HAND_CURSOR = 221188;
pub const GL_TRANSFORM_FEEDBACK_BUFFER_START = 35972;
pub const GLFW_KEY_SEMICOLON = 59;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const GL_ATTACHED_SHADERS = 35717;
pub const GL_COLOR_ATTACHMENT0 = 36064;
pub const GL_QUERY_RESULT_AVAILABLE = 34919;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __x86_64 = 1;
pub const GL_MAP_FLUSH_EXPLICIT_BIT = 16;
pub const GLFW_KEY_COMMA = 44;
pub const GL_STEREO = 3123;
pub const GL_MAX_TEXTURE_IMAGE_UNITS = 34930;
pub const GL_PACK_LSB_FIRST = 3329;
pub const GL_COMPRESSED_SIGNED_RG_RGTC2 = 36286;
pub const GLFW_MOD_SHIFT = 1;
pub const __UINTMAX_FMTo__ = c"lo";
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub inline fn glGetSynciv(arg0: GLsync, arg1: GLenum, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLint) void {
    return glad_glGetSynciv.?(arg0, arg1, arg2, arg3, arg4);
}
pub const PRIu8 = c"u";
pub const GL_ALPHA = 6406;
pub const GLFW_KEY_H = 72;
pub const GL_UNSIGNED_INT_10_10_10_2 = 32822;
pub const GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 36319;
pub const PTRDIFF_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __POINTER_WIDTH__ = 64;
pub const GL_RGBA = 6408;
pub const GL_QUERY_RESULT = 34918;
pub const __FLT16_DIG__ = 3;
pub const __SIZEOF_LONG__ = 8;
pub const GL_PACK_SWAP_BYTES = 3328;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const GL_PROXY_TEXTURE_2D = 32868;
pub inline fn glVertexAttribI3iv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttribI3iv.?(arg0, arg1);
}
pub const GL_MAX_VERTEX_ATTRIBS = 34921;
pub const GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 36428;
pub const GL_BACK_LEFT = 1026;
pub const GLFW_NO_ROBUSTNESS = 0;
pub const GL_TEXTURE0 = 33984;
pub const GL_SAMPLE_ALPHA_TO_COVERAGE = 32926;
pub const __NO_INLINE__ = 1;
pub const GL_STENCIL_PASS_DEPTH_PASS = 2966;
pub const GL_SRC_ALPHA_SATURATE = 776;
pub const GL_TEXTURE_BINDING_3D = 32874;
pub const GL_TEXTURE_COMPRESSED = 34465;
pub const GL_STENCIL_VALUE_MASK = 2963;
pub inline fn glVertexAttribI4usv(arg0: GLuint, arg1: ?[*]const GLushort) void {
    return glad_glVertexAttribI4usv.?(arg0, arg1);
}
pub const GL_DELETE_STATUS = 35712;
pub const GL_SAMPLER_BINDING = 35097;
pub const GL_FRONT_AND_BACK = 1032;
pub inline fn glBlendEquation(arg0: GLenum) void {
    return glad_glBlendEquation.?(arg0);
}
pub const PRIdLEAST32 = c"d";
pub inline fn glUseProgram(arg0: GLuint) void {
    return glad_glUseProgram.?(arg0);
}
pub const __FLT_RADIX__ = 2;
pub const GL_DEPTH_COMPONENT24 = 33190;
pub const __GLIBC_MINOR__ = 28;
pub const GL_DRAW_BUFFER3 = 34856;
pub inline fn glStencilOpSeparate(arg0: GLenum, arg1: GLenum, arg2: GLenum, arg3: GLenum) void {
    return glad_glStencilOpSeparate.?(arg0, arg1, arg2, arg3);
}
pub const GL_RGBA8 = 32856;
pub const GLFW_KEY_B = 66;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const GL_DST_ALPHA = 772;
pub const GL_FUNC_ADD = 32774;
pub const GL_UNSIGNED_INT_VEC2 = 36294;
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 35396;
pub const GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 33300;
pub const GL_STREAM_COPY = 35042;
pub const GL_POLYGON_OFFSET_FACTOR = 32824;
pub const GL_FLOAT_VEC2 = 35664;
pub inline fn glCopyTexImage1D(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLint, arg4: GLint, arg5: GLsizei, arg6: GLint) void {
    return glad_glCopyTexImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const GL_INT_SAMPLER_CUBE = 36300;
pub const GL_LINE = 6913;
pub const GL_GEOMETRY_OUTPUT_TYPE = 35096;
pub inline fn glVertexAttribI3ui(arg0: GLuint, arg1: GLuint, arg2: GLuint, arg3: GLuint) void {
    return glad_glVertexAttribI3ui.?(arg0, arg1, arg2, arg3);
}
pub const __INT64_FMTi__ = c"li";
pub inline fn glDrawArraysInstanced(arg0: GLenum, arg1: GLint, arg2: GLsizei, arg3: GLsizei) void {
    return glad_glDrawArraysInstanced.?(arg0, arg1, arg2, arg3);
}
pub const GLFW_KEY_F19 = 308;
pub const GL_INT_VEC4 = 35669;
pub inline fn glDrawBuffers(arg0: GLsizei, arg1: ?[*]const GLenum) void {
    return glad_glDrawBuffers.?(arg0, arg1);
}
pub const GL_SMOOTH_LINE_WIDTH_GRANULARITY = 2851;
pub inline fn glGetQueryObjectiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetQueryObjectiv.?(arg0, arg1, arg2);
}
pub inline fn glVertexAttribI2ui(arg0: GLuint, arg1: GLuint, arg2: GLuint) void {
    return glad_glVertexAttribI2ui.?(arg0, arg1, arg2);
}
pub const GL_STENCIL_INDEX = 6401;
pub const GL_MAX_FRAGMENT_UNIFORM_BLOCKS = 35373;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = 0.000000;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const GL_RGBA8I = 36238;
pub const __PIC__ = 2;
pub const __GID_T_TYPE = __U32_TYPE;
pub const GL_MAX_TEXTURE_SIZE = 3379;
pub const GL_BOOL_VEC4 = 35673;
pub const GL_NOTEQUAL = 517;
pub const GL_INVALID_VALUE = 1281;
pub const GL_FRAMEBUFFER_DEFAULT = 33304;
pub const _DEFAULT_SOURCE = 1;
pub inline fn glVertexAttrib3dv(arg0: GLuint, arg1: ?[*]const GLdouble) void {
    return glad_glVertexAttrib3dv.?(arg0, arg1);
}
pub const GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 35381;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const GLFW_JOYSTICK_12 = 11;
pub const GLFW_ARROW_CURSOR = 221185;
pub const GL_COLOR_ATTACHMENT28 = 36092;
pub inline fn glGetShaderiv(arg0: GLuint, arg1: GLenum, arg2: ?*GLint) void {
    return glad_glGetShaderiv.?(arg0, arg1, arg2);
}
pub inline fn glDeleteVertexArrays(arg0: GLsizei, arg1: ?*const GLuint) void {
    return glad_glDeleteVertexArrays.?(arg0, arg1);
}
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const GL_TEXTURE25 = 34009;
pub const GLFW_KEY_F13 = 302;
pub const GL_CONTEXT_PROFILE_MASK = 37158;
pub const GL_MAP_UNSYNCHRONIZED_BIT = 32;
pub const GL_TEXTURE14 = 33998;
pub inline fn glTexParameterIuiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glTexParameterIuiv.?(arg0, arg1, arg2);
}
pub const GL_DRAW_BUFFER10 = 34863;
pub const GLFW_MOUSE_BUTTON_1 = 0;
pub const GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 37156;
pub const GL_PRIMITIVE_RESTART_INDEX = 36766;
pub const GL_BGR = 32992;
pub const GL_POINT_SIZE_RANGE = 2834;
pub const INT32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const GLFW_KEY_UNKNOWN = -1;
pub const GLFW_KEY_V = 86;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __UINT8_FMTX__ = c"hhX";
pub inline fn glVertexAttribI2uiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttribI2uiv.?(arg0, arg1);
}
pub const GL_DEPTH_TEST = 2929;
pub inline fn glGetBufferPointerv(arg0: GLenum, arg1: GLenum, arg2: ?[*](?*c_void)) void {
    return glad_glGetBufferPointerv.?(arg0, arg1, arg2);
}
pub const GL_RG16 = 33324;
pub const GL_RGB8_SNORM = 36758;
pub const GL_UNIFORM_BUFFER_START = 35369;
pub const GL_COPY_WRITE_BUFFER = 36663;
pub inline fn glUniform4uiv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLuint) void {
    return glad_glUniform4uiv.?(arg0, arg1, arg2);
}
pub inline fn glGetRenderbufferParameteriv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetRenderbufferParameteriv.?(arg0, arg1, arg2);
}
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub inline fn glUniform2ui(arg0: GLint, arg1: GLuint, arg2: GLuint) void {
    return glad_glUniform2ui.?(arg0, arg1, arg2);
}
pub const GL_RENDERBUFFER_BINDING = 36007;
pub inline fn glVertexP3ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glVertexP3ui.?(arg0, arg1);
}
pub const GLFW_KEY_KP_7 = 327;
pub const GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 35379;
pub const GL_LINE_WIDTH = 2849;
pub const __INT16_FMTd__ = c"hd";
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 36321;
pub inline fn glMultiTexCoordP2uiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glMultiTexCoordP2uiv.?(arg0, arg1, arg2);
}
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const GLFW_JOYSTICK_2 = 1;
pub inline fn glUniform3i(arg0: GLint, arg1: GLint, arg2: GLint, arg3: GLint) void {
    return glad_glUniform3i.?(arg0, arg1, arg2, arg3);
}
pub const __INTMAX_WIDTH__ = 64;
pub const GL_UNSIGNED_INT_8_8_8_8_REV = 33639;
pub const GL_UNPACK_SKIP_IMAGES = 32877;
pub const GL_MAX_COLOR_TEXTURE_SAMPLES = 37134;
pub inline fn glPolygonOffset(arg0: GLfloat, arg1: GLfloat) void {
    return glad_glPolygonOffset.?(arg0, arg1);
}
pub const GLFW_CONTEXT_NO_ERROR = 139274;
pub const __USE_POSIX = 1;
pub const GL_TEXTURE_WRAP_R = 32882;
pub const GL_STENCIL_WRITEMASK = 2968;
pub const GL_R32I = 33333;
pub const GL_R32UI = 33334;
pub inline fn glFrontFace(arg0: GLenum) void {
    return glad_glFrontFace.?(arg0);
}
pub const PRIiFAST8 = c"i";
pub const __INT_FAST8_FMTi__ = c"hhi";
pub inline fn glVertexAttribP2uiv(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: ?[*]const GLuint) void {
    return glad_glVertexAttribP2uiv.?(arg0, arg1, arg2, arg3);
}
pub const GL_INT_SAMPLER_3D = 36299;
pub const GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 35660;
pub const GL_BACK_RIGHT = 1027;
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 37125;
pub inline fn glVertexAttrib1sv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttrib1sv.?(arg0, arg1);
}
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const GLFW_STICKY_MOUSE_BUTTONS = 208899;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GXX_ABI_VERSION = 1002;
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 35397;
pub const GL_SYNC_FLUSH_COMMANDS_BIT = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const GLFW_VERSION_UNAVAILABLE = 65543;
pub const __STDC__ = 1;
pub const GL_QUERY_WAIT = 36371;
pub const GL_TEXTURE_COMPRESSION_HINT = 34031;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const GL_BOOL = 35670;
pub const GL_TEXTURE_COMPRESSED_IMAGE_SIZE = 34464;
pub inline fn glViewport(arg0: GLint, arg1: GLint, arg2: GLsizei, arg3: GLsizei) void {
    return glad_glViewport.?(arg0, arg1, arg2, arg3);
}
pub const __INT_LEAST64_FMTi__ = c"li";
pub const GL_TEXTURE_SWIZZLE_A = 36421;
pub const GL_SAMPLE_BUFFERS = 32936;
pub const GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 35723;
pub const __INT_FAST16_MAX__ = 32767;
pub const GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 35380;
pub const GL_ALWAYS = 519;
pub const GLFW_KEY_0 = 48;
pub const GLFW_MOD_SUPER = 8;
pub const GLFW_KEY_F1 = 290;
pub inline fn glVertexAttrib4bv(arg0: GLuint, arg1: ?[*]const GLbyte) void {
    return glad_glVertexAttrib4bv.?(arg0, arg1);
}
pub inline fn glSecondaryColorP3ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glSecondaryColorP3ui.?(arg0, arg1);
}
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const GL_R3_G3_B2 = 10768;
pub const GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 35881;
pub const GLFW_KEY_LAST = GLFW_KEY_MENU;
pub const GL_DECR = 7683;
pub const GL_UNSIGNED_SHORT_5_6_5_REV = 33636;
pub const GL_R16UI = 33332;
pub const __FLT16_MANT_DIG__ = 11;
pub const GLFW_ACCUM_BLUE_BITS = 135177;
pub const GL_COLOR_ATTACHMENT1 = 36065;
pub inline fn glFinish() void {
    return glad_glFinish.?();
}
pub inline fn glBindRenderbuffer(arg0: GLenum, arg1: GLuint) void {
    return glad_glBindRenderbuffer.?(arg0, arg1);
}
pub const GL_STENCIL_CLEAR_VALUE = 2961;
pub const GL_LINEAR = 9729;
pub const GL_POLYGON_SMOOTH = 2881;
pub const GL_LEQUAL = 515;
pub inline fn glPointParameterfv(arg0: GLenum, arg1: ?[*]const GLfloat) void {
    return glad_glPointParameterfv.?(arg0, arg1);
}
pub const GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 35978;
pub inline fn glGetVertexAttribiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetVertexAttribiv.?(arg0, arg1, arg2);
}
pub const PRIXFAST8 = c"X";
pub const __FLT_DENORM_MIN__ = 0.000000;
pub const SIG_ATOMIC_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub inline fn glGetUniformBlockIndex(arg0: GLuint, arg1: ?[*]const GLchar) GLuint {
    return glad_glGetUniformBlockIndex.?(arg0, arg1);
}
pub inline fn glGetTexLevelParameterfv(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: ?[*]GLfloat) void {
    return glad_glGetTexLevelParameterfv.?(arg0, arg1, arg2, arg3);
}
pub inline fn glDepthRange(arg0: GLdouble, arg1: GLdouble) void {
    return glad_glDepthRange.?(arg0, arg1);
}
pub const GLFW_KEY_I = 73;
pub const GLFW_OPENGL_ANY_PROFILE = 0;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const GL_CONTEXT_CORE_PROFILE_BIT = 1;
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 36052;
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const GL_SHADING_LANGUAGE_VERSION = 35724;
pub inline fn glSamplerParameterIuiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glSamplerParameterIuiv.?(arg0, arg1, arg2);
}
pub const GL_ONE_MINUS_CONSTANT_ALPHA = 32772;
pub const __UINT16_FMTu__ = c"hu";
pub const GL_SMOOTH_LINE_WIDTH_RANGE = 2850;
pub const GL_DEPTH_RANGE = 2928;
pub const GL_BLUE = 6405;
pub const GL_TEXTURE1 = 33985;
pub const GL_MAX_UNIFORM_BLOCK_SIZE = 35376;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const GL_STENCIL_FUNC = 2962;
pub const __LDBL_MIN_EXP__ = -16381;
pub const __pie__ = 2;
pub const SIZE_MAX = c_ulong(18446744073709551615);
pub const __SSP_STRONG__ = 2;
pub const GL_R8 = 33321;
pub const __clang_patchlevel__ = 1;
pub const PRId16 = c"d";
pub const GLFW_NO_API = 0;
pub const GL_VERTEX_ATTRIB_ARRAY_TYPE = 34341;
pub const GL_PACK_IMAGE_HEIGHT = 32876;
pub inline fn glTexSubImage2D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLsizei, arg5: GLsizei, arg6: GLenum, arg7: GLenum, arg8: ?*const c_void) void {
    return glad_glTexSubImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
pub const __FXSR__ = 1;
pub const GL_DRAW_FRAMEBUFFER_BINDING = 36006;
pub const GLFW_KEY_C = 67;
pub const __UINT32_FMTx__ = c"x";
pub const GL_SRGB = 35904;
pub inline fn glDepthMask(arg0: GLboolean) void {
    return glad_glDepthMask.?(arg0);
}
pub const GLFW_CONTEXT_REVISION = 139268;
pub const PRIX32 = c"X";
pub const GL_FLOAT = 5126;
pub inline fn glTexParameterIiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLint) void {
    return glad_glTexParameterIiv.?(arg0, arg1, arg2);
}
pub const GLFW_KEY_PAGE_UP = 266;
pub const GL_STATIC_DRAW = 35044;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const SCNxLEAST32 = c"x";
pub const GL_RG8I = 33335;
pub inline fn glVertexAttrib4uiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttrib4uiv.?(arg0, arg1);
}
pub const GL_REPEAT = 10497;
pub inline fn glNormalP3ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glNormalP3ui.?(arg0, arg1);
}
pub const GLFW_RED_BITS = 135169;
pub const GL_FLOAT_VEC3 = 35665;
pub const __USE_ISOC11 = 1;
pub const GLFW_KEY_F18 = 307;
pub const GL_PROVOKING_VERTEX = 36431;
pub const __tune_k8__ = 1;
pub const GL_CONSTANT_ALPHA = 32771;
pub inline fn glVertexAttrib2f(arg0: GLuint, arg1: GLfloat, arg2: GLfloat) void {
    return glad_glVertexAttrib2f.?(arg0, arg1, arg2);
}
pub const GL_COLOR_BUFFER_BIT = 16384;
pub inline fn glColorP3ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glColorP3ui.?(arg0, arg1);
}
pub const __UINT64_C_SUFFIX__ = UL;
pub const __UINTMAX_FMTx__ = c"lx";
pub const GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 33302;
pub const __INT_LEAST16_MAX__ = 32767;
pub const GL_RGBA12 = 32858;
pub const __UINT32_FMTo__ = c"o";
pub inline fn glGenQueries(arg0: GLsizei, arg1: ?[*]GLuint) void {
    return glad_glGenQueries.?(arg0, arg1);
}
pub const SCNi16 = c"hi";
pub const GL_VALIDATE_STATUS = 35715;
pub const GL_OBJECT_TYPE = 37138;
pub inline fn glGenSamplers(arg0: GLsizei, arg1: ?[*]GLuint) void {
    return glad_glGenSamplers.?(arg0, arg1);
}
pub const GLFW_JOYSTICK_13 = 12;
pub const GL_PIXEL_UNPACK_BUFFER_BINDING = 35055;
pub const GLFW_KEY_KP_SUBTRACT = 333;
pub const GL_COLOR_ATTACHMENT29 = 36093;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const GL_TEXTURE_1D = 3552;
pub const GL_TEXTURE26 = 34010;
pub const GL_STENCIL_REF = 2967;
pub const GLFW_KEY_F12 = 301;
pub const GL_R16_SNORM = 36760;
pub const GL_MIRRORED_REPEAT = 33648;
pub const GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 35377;
pub const GL_RENDERBUFFER_STENCIL_SIZE = 36181;
pub const GL_UNIFORM_SIZE = 35384;
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 34070;
pub const GL_TEXTURE17 = 34001;
pub const __amd64 = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const GL_RGB16 = 32852;
pub inline fn glUniform3f(arg0: GLint, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat) void {
    return glad_glUniform3f.?(arg0, arg1, arg2, arg3);
}
pub const GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 35378;
pub const GL_CLIP_DISTANCE5 = 12293;
pub const GL_UNSIGNED_SHORT = 5123;
pub const GLFW_KEY_W = 87;
pub inline fn glTexImage3D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLsizei, arg4: GLsizei, arg5: GLsizei, arg6: GLint, arg7: GLenum, arg8: GLenum, arg9: ?*const c_void) void {
    return glad_glTexImage3D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}
pub const GL_MAX_PROGRAM_TEXEL_OFFSET = 35077;
pub const GL_SCISSOR_BOX = 3088;
pub const GL_RGB10_A2UI = 36975;
pub const GL_RGBA32I = 36226;
pub const GL_ALREADY_SIGNALED = 37146;
pub const GLFW_INVALID_VALUE = 65540;
pub const INT_FAST16_MAX = c_long(9223372036854775807);
pub const GL_EQUIV = 5385;
pub const GL_SRC_ALPHA = 770;
pub const GLFW_CONTEXT_CREATION_API = 139275;
pub const GL_VERSION_2_1 = 1;
pub const GL_RG16I = 33337;
pub inline fn glBeginConditionalRender(arg0: GLuint, arg1: GLenum) void {
    return glad_glBeginConditionalRender.?(arg0, arg1);
}
pub const GL_PRIMITIVES_GENERATED = 35975;
pub const __INT_FAST32_FMTd__ = c"d";
pub const GL_LINEAR_MIPMAP_NEAREST = 9985;
pub const GLFW_DECORATED = 131077;
pub const GL_DEPTH_BUFFER_BIT = 256;
pub const GL_UNIFORM_BLOCK_NAME_LENGTH = 35393;
pub const GLFW_KEY_KP_4 = 324;
pub const GL_RGBA16I = 36232;
pub const GLFW_CROSSHAIR_CURSOR = 221187;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const GL_SAMPLE_MASK_VALUE = 36434;
pub const GL_NONE = 0;
pub const GL_TRIANGLE_STRIP_ADJACENCY = 13;
pub inline fn glColorP4uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glColorP4uiv.?(arg0, arg1);
}
pub const GL_TRANSFORM_FEEDBACK_BUFFER = 35982;
pub const GL_BLEND_EQUATION = 32777;
pub const __GLIBC__ = 2;
pub const GL_FASTEST = 4353;
pub inline fn glDrawRangeElements(arg0: GLenum, arg1: GLuint, arg2: GLuint, arg3: GLsizei, arg4: GLenum, arg5: ?*const c_void) void {
    return glad_glDrawRangeElements.?(arg0, arg1, arg2, arg3, arg4, arg5);
}
pub const GL_MAP_INVALIDATE_RANGE_BIT = 4;
pub const GL_RGB32UI = 36209;
pub const GL_TEXTURE_WRAP_S = 10242;
pub const GL_DEPTH = 6145;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 33303;
pub inline fn glGetQueryObjectuiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLuint) void {
    return glad_glGetQueryObjectuiv.?(arg0, arg1, arg2);
}
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const GL_RENDERBUFFER = 36161;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const GL_OUT_OF_MEMORY = 1285;
pub const GL_WRITE_ONLY = 35001;
pub const GLFW_CONNECTED = 262145;
pub const __INT32_FMTi__ = c"i";
pub const GL_WAIT_FAILED = 37149;
pub const __DBL_HAS_INFINITY__ = 1;
pub const GL_INT_SAMPLER_1D = 36297;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const GL_TEXTURE_LOD_BIAS = 34049;
pub const GLFW_ACCUM_RED_BITS = 135175;
pub const GL_UNSIGNED_INT_SAMPLER_2D = 36306;
pub const __SIZEOF_FLOAT__ = 4;
pub inline fn glTexParameterf(arg0: GLenum, arg1: GLenum, arg2: GLfloat) void {
    return glad_glTexParameterf.?(arg0, arg1, arg2);
}
pub const INT_FAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const GLFW_CURSOR_NORMAL = 212993;
pub const GL_CURRENT_PROGRAM = 35725;
pub const GL_UNSIGNALED = 37144;
pub inline fn glVertexAttrib4Nub(arg0: GLuint, arg1: GLubyte, arg2: GLubyte, arg3: GLubyte, arg4: GLubyte) void {
    return glad_glVertexAttrib4Nub.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __INT_LEAST32_FMTd__ = c"d";
pub const GL_TEXTURE_MAG_FILTER = 10240;
pub const GL_TEXTURE_SWIZZLE_B = 36420;
pub const GL_SHORT = 5122;
pub const GLFW_KEY_1 = 49;
pub inline fn glLinkProgram(arg0: GLuint) void {
    return glad_glLinkProgram.?(arg0);
}
pub const GLFW_KEY_F2 = 291;
pub const GLFW_FOCUSED = 131073;
pub const GL_POINT_SIZE_GRANULARITY = 2835;
pub const GL_PACK_ALIGNMENT = 3333;
pub const GL_COLOR_ATTACHMENT6 = 36070;
pub inline fn glUniformMatrix3x2fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix3x2fv.?(arg0, arg1, arg2, arg3);
}
pub const GLFW_KEY_APOSTROPHE = 39;
pub inline fn glBindFramebuffer(arg0: GLenum, arg1: GLuint) void {
    return glad_glBindFramebuffer.?(arg0, arg1);
}
pub inline fn glVertexAttrib2s(arg0: GLuint, arg1: GLshort, arg2: GLshort) void {
    return glad_glVertexAttrib2s.?(arg0, arg1, arg2);
}
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 33299;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const SCNoLEAST32 = c"o";
pub const GL_RENDERBUFFER_ALPHA_SIZE = 36179;
pub inline fn glUniform3fv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLfloat) void {
    return glad_glUniform3fv.?(arg0, arg1, arg2);
}
pub const GL_ONE_MINUS_CONSTANT_COLOR = 32770;
pub const GL_DEPTH_COMPONENT32F = 36012;
pub inline fn glVertexAttrib4usv(arg0: GLuint, arg1: ?[*]const GLushort) void {
    return glad_glVertexAttrib4usv.?(arg0, arg1);
}
pub const __DBL_HAS_DENORM__ = 1;
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub inline fn glVertexAttribP1ui(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: GLuint) void {
    return glad_glVertexAttribP1ui.?(arg0, arg1, arg2, arg3);
}
pub const __ATOMIC_RELAXED = 0;
pub const __UINT_FAST16_MAX__ = 65535;
pub const GLFW_KEY_WORLD_2 = 162;
pub const GL_TEXTURE6 = 33990;
pub const __MODE_T_TYPE = __U32_TYPE;
pub inline fn glTexCoordP4uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glTexCoordP4uiv.?(arg0, arg1);
}
pub const GLAPIENTRY = APIENTRY;
pub const GL_TEXTURE_RED_SIZE = 32860;
pub const GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 35967;
pub inline fn glVertexAttrib4Nuiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttrib4Nuiv.?(arg0, arg1);
}
pub const PTRDIFF_MAX = c_long(9223372036854775807);
pub const GLFW_DONT_CARE = -1;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const __STDC_ISO_10646__ = c_long(201706);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 35983;
pub const __STDC_HOSTED__ = 1;
pub const GL_FRAMEBUFFER_COMPLETE = 36053;
pub const __INT_LEAST32_TYPE__ = int;
pub const GLFW_KEY_EQUAL = 61;
pub inline fn glUniform1uiv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLuint) void {
    return glad_glUniform1uiv.?(arg0, arg1, arg2);
}
pub const GL_TEXTURE_BLUE_TYPE = 35858;
pub const GL_DOUBLE = 5130;
pub const GL_TEXTURE_MAX_LOD = 33083;
pub const __FLT16_MIN_EXP__ = -14;
pub const GL_VERTEX_ATTRIB_ARRAY_ENABLED = 34338;
pub const GL_SAMPLER_2D_MULTISAMPLE = 37128;
pub const GL_PROXY_TEXTURE_1D_ARRAY = 35865;
pub const GL_UNSIGNED_INT = 5125;
pub const GL_ELEMENT_ARRAY_BUFFER = 34963;
pub inline fn glEnableVertexAttribArray(arg0: GLuint) void {
    return glad_glEnableVertexAttribArray.?(arg0);
}
pub const GLFW_CONTEXT_ROBUSTNESS = 139269;
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 36049;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const GL_SIGNED_NORMALIZED = 36764;
pub inline fn glIsEnabledi(arg0: GLenum, arg1: GLuint) GLboolean {
    return glad_glIsEnabledi.?(arg0, arg1);
}
pub const GL_RENDERBUFFER_GREEN_SIZE = 36177;
pub const GL_TEXTURE_WIDTH = 4096;
pub inline fn glGetTexParameteriv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetTexParameteriv.?(arg0, arg1, arg2);
}
pub const GL_SAMPLE_MASK = 36433;
pub const GL_TEXTURE_2D_ARRAY = 35866;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const GLFW_KEY_SPACE = 32;
pub const GL_VERTEX_ATTRIB_ARRAY_DIVISOR = 35070;
pub const GL_POLYGON_OFFSET_FILL = 32823;
pub inline fn glCopyTexSubImage2D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLint, arg6: GLsizei, arg7: GLsizei) void {
    return glad_glCopyTexSubImage2D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}
pub const __USE_ISOC95 = 1;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub inline fn glUniformMatrix2x4fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix2x4fv.?(arg0, arg1, arg2, arg3);
}
pub const GL_FRAMEBUFFER_SRGB = 36281;
pub const GL_LAST_VERTEX_CONVENTION = 36430;
pub const GL_R8_SNORM = 36756;
pub const GL_RENDERBUFFER_WIDTH = 36162;
pub const GLFW_KEY_Z = 90;
pub const GL_POINT_SIZE = 2833;
pub inline fn glVertexP2uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glVertexP2uiv.?(arg0, arg1);
}
pub const __LITTLE_ENDIAN__ = 1;
pub const PRIi16 = c"i";
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const SCNxLEAST8 = c"hhx";
pub const SCNdLEAST8 = c"hhd";
pub const GL_TRIANGLE_STRIP = 5;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const GL_TEXTURE_BINDING_2D_ARRAY = 35869;
pub inline fn glVertexAttribI1iv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttribI1iv.?(arg0, arg1);
}
pub const GL_SAMPLE_POSITION = 36432;
pub const UINT16_MAX = 65535;
pub const GL_TEXTURE27 = 34011;
pub const GLFW_KEY_F11 = 300;
pub inline fn glVertexAttrib4Nusv(arg0: GLuint, arg1: ?[*]const GLushort) void {
    return glad_glVertexAttrib4Nusv.?(arg0, arg1);
}
pub const GL_PACK_SKIP_IMAGES = 32875;
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 34072;
pub const GL_COMPRESSED_SRGB = 35912;
pub inline fn glColorP4ui(arg0: GLenum, arg1: GLuint) void {
    return glad_glColorP4ui.?(arg0, arg1);
}
pub const __warnattr = msg;
pub const GL_VERSION = 7938;
pub const __STD_TYPE = typedef;
pub const GL_TEXTURE16 = 34000;
pub inline fn glBlitFramebuffer(arg0: GLint, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLint, arg6: GLint, arg7: GLint, arg8: GLbitfield, arg9: GLenum) void {
    return glad_glBlitFramebuffer.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}
pub inline fn glGetActiveAttrib(arg0: GLuint, arg1: GLuint, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLint, arg5: ?[*]GLenum, arg6: ?[*]GLchar) void {
    return glad_glGetActiveAttrib.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const GLFW_MOUSE_BUTTON_7 = 6;
pub const _LP64 = 1;
pub const GL_TIMEOUT_EXPIRED = 37147;
pub const GL_UNIFORM_NAME_LENGTH = 35385;
pub const PRIXLEAST8 = c"X";
pub const GL_ALIASED_LINE_WIDTH_RANGE = 33902;
pub const GLFW_STICKY_KEYS = 208898;
pub const GL_CLIP_DISTANCE4 = 12292;
pub const GLFW_KEY_TAB = 258;
pub const __FLT_DIG__ = 6;
pub const GLFW_KEY_T = 84;
pub const __FLT_MAX_10_EXP__ = 38;
pub inline fn glGetBooleanv(arg0: GLenum, arg1: ?[*]GLboolean) void {
    return glad_glGetBooleanv.?(arg0, arg1);
}
pub inline fn glDetachShader(arg0: GLuint, arg1: GLuint) void {
    return glad_glDetachShader.?(arg0, arg1);
}
pub const _FEATURES_H = 1;
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const GL_COLOR_ATTACHMENT31 = 36095;
pub inline fn glGetIntegeri_v(arg0: GLenum, arg1: GLuint, arg2: ?[*]GLint) void {
    return glad_glGetIntegeri_v.?(arg0, arg1, arg2);
}
pub const GL_VERSION_2_0 = 1;
pub const GLFW_FLOATING = 131079;
pub const GL_DECR_WRAP = 34056;
pub const GL_COLOR_ATTACHMENT20 = 36084;
pub inline fn glIsRenderbuffer(arg0: GLuint) GLboolean {
    return glad_glIsRenderbuffer.?(arg0);
}
pub const GL_CLAMP_TO_BORDER = 33069;
pub const __DBL_MIN__ = 0.000000;
pub const GL_QUERY_BY_REGION_NO_WAIT = 36374;
pub const GL_COLOR_ATTACHMENT11 = 36075;
pub inline fn glClearDepth(arg0: GLdouble) void {
    return glad_glClearDepth.?(arg0);
}
pub const __S32_TYPE = int;
pub const PRIiLEAST32 = c"i";
pub inline fn glDeleteShader(arg0: GLuint) void {
    return glad_glDeleteShader.?(arg0);
}
pub const __FLT16_MAX_10_EXP__ = 4;
pub const GLFW_KEY_KP_5 = 325;
pub inline fn glTexImage3DMultisample(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: GLsizei, arg4: GLsizei, arg5: GLsizei, arg6: GLboolean) void {
    return glad_glTexImage3DMultisample.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const PRIiLEAST8 = c"i";
pub const GL_GREATER = 516;
pub const GL_NUM_COMPRESSED_TEXTURE_FORMATS = 34466;
pub const GL_ONE_MINUS_SRC1_ALPHA = 35067;
pub const GL_UNIFORM_BUFFER_BINDING = 35368;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const __gnu_linux__ = 1;
pub const GL_FRAMEBUFFER_UNSUPPORTED = 36061;
pub const GL_UNIFORM_BLOCK_INDEX = 35386;
pub const GL_STENCIL_BACK_PASS_DEPTH_PASS = 34819;
pub inline fn glDepthFunc(arg0: GLenum) void {
    return glad_glDepthFunc.?(arg0);
}
pub const GLFW_PLATFORM_ERROR = 65544;
pub const GLFW_TRUE = 1;
pub const GL_TEXTURE_WRAP_T = 10243;
pub const GL_STENCIL_INDEX4 = 36167;
pub const GL_GEQUAL = 518;
pub const GL_UNSIGNED_INT_8_8_8_8 = 32821;
pub const GLFW_MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8;
pub const GLFW_RELEASE = 0;
pub const GLFW_MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2;
pub const GL_READ_BUFFER = 3074;
pub const _INTTYPES_H = 1;
pub const GL_NUM_EXTENSIONS = 33309;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const GL_POLYGON_OFFSET_LINE = 10754;
pub const __USE_POSIX199506 = 1;
pub const __INT32_TYPE__ = int;
pub const SCNiLEAST32 = c"i";
pub const GLFW_KEY_LEFT = 263;
pub const GL_UNPACK_LSB_FIRST = 3313;
pub const GLFW_KEY_PRINT_SCREEN = 283;
pub const GL_BLEND_DST = 3040;
pub const GL_CONDITION_SATISFIED = 37148;
pub inline fn glMultiTexCoordP4ui(arg0: GLenum, arg1: GLenum, arg2: GLuint) void {
    return glad_glMultiTexCoordP4ui.?(arg0, arg1, arg2);
}
pub const GLFW_CURSOR_DISABLED = 212995;
pub const __FLT_MAX_EXP__ = 128;
pub const GL_COMPRESSED_SIGNED_RED_RGTC1 = 36284;
pub inline fn glIsSync(arg0: GLsync) GLboolean {
    return glad_glIsSync.?(arg0);
}
pub const GL_TRANSFORM_FEEDBACK_VARYINGS = 35971;
pub const GL_TEXTURE_BASE_LEVEL = 33084;
pub inline fn glUniform1ui(arg0: GLint, arg1: GLuint) void {
    return glad_glUniform1ui.?(arg0, arg1);
}
pub inline fn glProvokingVertex(arg0: GLenum) void {
    return glad_glProvokingVertex.?(arg0);
}
pub const GL_UNSIGNED_INT_SAMPLER_BUFFER = 36312;
pub const __INT_FAST64_FMTi__ = c"li";
pub inline fn glPolygonMode(arg0: GLenum, arg1: GLenum) void {
    return glad_glPolygonMode.?(arg0, arg1);
}
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = 36311;
pub inline fn glGetShaderSource(arg0: GLuint, arg1: GLsizei, arg2: ?[*]GLsizei, arg3: ?[*]GLchar) void {
    return glad_glGetShaderSource.?(arg0, arg1, arg2, arg3);
}
pub const GLFW_KEY_HOME = 268;
pub const GLFW_KEY_F3 = 292;
pub const GL_COMPRESSED_RED = 33317;
pub inline fn glVertexAttrib2sv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttrib2sv.?(arg0, arg1);
}
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 36050;
pub inline fn glCompressedTexImage1D(arg0: GLenum, arg1: GLint, arg2: GLenum, arg3: GLsizei, arg4: GLint, arg5: GLsizei, arg6: ?*const c_void) void {
    return glad_glCompressedTexImage1D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub inline fn glGetUniformLocation(arg0: GLuint, arg1: ?[*]const GLchar) GLint {
    return glad_glGetUniformLocation.?(arg0, arg1);
}
pub const GL_SRGB8_ALPHA8 = 35907;
pub inline fn glVertexAttribI4ui(arg0: GLuint, arg1: GLuint, arg2: GLuint, arg3: GLuint, arg4: GLuint) void {
    return glad_glVertexAttribI4ui.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __LDBL_REDIR_DECL = name;
pub const GL_SRC1_COLOR = 35065;
pub const GL_COLOR_ATTACHMENT7 = 36071;
pub const GL_R16 = 33322;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const GL_KEEP = 7680;
pub inline fn glActiveTexture(arg0: GLenum) void {
    return glad_glActiveTexture.?(arg0);
}
pub inline fn glCompressedTexSubImage3D(arg0: GLenum, arg1: GLint, arg2: GLint, arg3: GLint, arg4: GLint, arg5: GLsizei, arg6: GLsizei, arg7: GLsizei, arg8: GLenum, arg9: GLsizei, arg10: ?*const c_void) void {
    return glad_glCompressedTexSubImage3D.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
}
pub const GL_MAX_SAMPLE_MASK_WORDS = 36441;
pub inline fn glClearColor(arg0: GLfloat, arg1: GLfloat, arg2: GLfloat, arg3: GLfloat) void {
    return glad_glClearColor.?(arg0, arg1, arg2, arg3);
}
pub const GL_RG16_SNORM = 36761;
pub const __DBL_EPSILON__ = 0.000000;
pub const GL_DRAW_BUFFER = 3073;
pub const GL_MAX_VARYING_FLOATS = 35659;
pub const GL_MAX_3D_TEXTURE_SIZE = 32883;
pub const GL_UNSIGNED_SHORT_5_5_5_1 = 32820;
pub const GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 35661;
pub const GL_TEXTURE_2D = 3553;
pub const GLFW_ICONIFIED = 131074;
pub const __CHAR_BIT__ = 8;
pub const GLFW_PRESS = 1;
pub const __INT16_FMTi__ = c"hi";
pub const INT_LEAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __GNUC_MINOR__ = 2;
pub const GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = 35722;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const GL_UNPACK_ALIGNMENT = 3317;
pub const GL_MAX_CUBE_MAP_TEXTURE_SIZE = 34076;
pub const GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 37127;
pub const __FLT_EPSILON__ = 0.000000;
pub const GLFW_NO_RESET_NOTIFICATION = 200705;
pub const GLFW_KEY_WORLD_1 = 161;
pub const GL_VERSION_1_4 = 1;
pub const GL_TEXTURE7 = 33991;
pub const GLFW_KEY_RIGHT_CONTROL = 345;
pub const GL_VERTEX_ATTRIB_ARRAY_SIZE = 34339;
pub inline fn glDrawElements(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: ?*const c_void) void {
    return glad_glDrawElements.?(arg0, arg1, arg2, arg3);
}
pub const GL_RGB = 6407;
pub const INT16_MAX = 32767;
pub const GL_INTERLEAVED_ATTRIBS = 35980;
pub inline fn glVertexAttribI4iv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttribI4iv.?(arg0, arg1);
}
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub inline fn glGetBufferParameteriv(arg0: GLenum, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetBufferParameteriv.?(arg0, arg1, arg2);
}
pub inline fn glPointSize(arg0: GLfloat) void {
    return glad_glPointSize.?(arg0);
}
pub const GL_FRONT = 1028;
pub const NULL = if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Pointer) @ptrCast([*]void, 0) else if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Int) @intToPtr([*]void, 0) else ([*]void)(0);
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const GL_SRC_COLOR = 768;
pub inline fn glUniformMatrix2fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix2fv.?(arg0, arg1, arg2, arg3);
}
pub const GL_DONT_CARE = 4352;
pub const GL_STENCIL_BUFFER_BIT = 1024;
pub const GL_TEXTURE_BLUE_SIZE = 32862;
pub inline fn glVertexAttrib4Niv(arg0: GLuint, arg1: ?[*]const GLint) void {
    return glad_glVertexAttrib4Niv.?(arg0, arg1);
}
pub const GL_ACTIVE_ATTRIBUTES = 35721;
pub const GLFW_KEY_A = 65;
pub const GL_FUNC_SUBTRACT = 32778;
pub inline fn glGetActiveUniformsiv(arg0: GLuint, arg1: GLsizei, arg2: ?[*]const GLuint, arg3: GLenum, arg4: ?[*]GLint) void {
    return glad_glGetActiveUniformsiv.?(arg0, arg1, arg2, arg3, arg4);
}
pub const __UINT32_C_SUFFIX__ = U;
pub const GL_STATIC_READ = 35045;
pub const GL_TEXTURE_2D_MULTISAMPLE_ARRAY = 37122;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub inline fn glGetStringi(arg0: GLenum, arg1: GLuint) ?[*]const GLubyte {
    return glad_glGetStringi.?(arg0, arg1);
}
pub const GL_FALSE = 0;
pub const APIENTRYP = [*]APIENTRY;
pub const GL_TEXTURE_RECTANGLE = 34037;
pub inline fn glStencilFunc(arg0: GLenum, arg1: GLint, arg2: GLuint) void {
    return glad_glStencilFunc.?(arg0, arg1, arg2);
}
pub const GL_PACK_SKIP_PIXELS = 3332;
pub inline fn glMultiTexCoordP1uiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glMultiTexCoordP1uiv.?(arg0, arg1, arg2);
}
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const GL_DITHER = 3024;
pub const GL_INFO_LOG_LENGTH = 35716;
pub const GL_LOGIC_OP_MODE = 3056;
pub const __STDC_UTF_16__ = 1;
pub const GL_BLEND_COLOR = 32773;
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub inline fn glIsFramebuffer(arg0: GLuint) GLboolean {
    return glad_glIsFramebuffer.?(arg0);
}
pub const GL_CLAMP_READ_COLOR = 35100;
pub const GL_CW = 2304;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub inline fn glVertexAttrib2d(arg0: GLuint, arg1: GLdouble, arg2: GLdouble) void {
    return glad_glVertexAttrib2d.?(arg0, arg1, arg2);
}
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;
pub const PRIx16 = c"x";
pub const GL_BLEND_EQUATION_RGB = 32777;
pub const GL_ACTIVE_UNIFORM_MAX_LENGTH = 35719;
pub const GL_DRAW_BUFFER4 = 34857;
pub const GLFW_KEY_DELETE = 261;
pub const __INT16_TYPE__ = short;
pub const GLFW_KEY_END = 269;
pub inline fn glGetSamplerParameterIuiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLuint) void {
    return glad_glGetSamplerParameterIuiv.?(arg0, arg1, arg2);
}
pub const GL_TEXTURE_BINDING_1D = 32872;
pub const GL_SRGB_ALPHA = 35906;
pub inline fn glVertexAttrib4d(arg0: GLuint, arg1: GLdouble, arg2: GLdouble, arg3: GLdouble, arg4: GLdouble) void {
    return glad_glVertexAttrib4d.?(arg0, arg1, arg2, arg3, arg4);
}
pub const UINT_LEAST16_MAX = 65535;
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = 0;
pub const UINT_LEAST32_MAX = c_uint(4294967295);
pub inline fn glGetTransformFeedbackVarying(arg0: GLuint, arg1: GLuint, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLsizei, arg5: ?[*]GLenum, arg6: ?[*]GLchar) void {
    return glad_glGetTransformFeedbackVarying.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const GLFW_MOD_CONTROL = 2;
pub inline fn glVertexAttribI3uiv(arg0: GLuint, arg1: ?[*]const GLuint) void {
    return glad_glVertexAttribI3uiv.?(arg0, arg1);
}
pub const GLFW_KEY_KP_ENTER = 335;
pub const GL_FLOAT_MAT4 = 35676;
pub const PRIXLEAST16 = c"X";
pub inline fn glGetVertexAttribIiv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLint) void {
    return glad_glGetVertexAttribIiv.?(arg0, arg1, arg2);
}
pub const GLFW_KEY_GRAVE_ACCENT = 96;
pub const GL_BYTE = 5120;
pub const PRIi8 = c"i";
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __SSE2__ = 1;
pub const GL_TEXTURE28 = 34012;
pub const GLFW_KEY_F10 = 299;
pub const GL_INT = 5124;
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 34074;
pub inline fn glVertexAttribI3i(arg0: GLuint, arg1: GLint, arg2: GLint, arg3: GLint) void {
    return glad_glVertexAttribI3i.?(arg0, arg1, arg2, arg3);
}
pub inline fn glVertexAttribP3uiv(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: ?[*]const GLuint) void {
    return glad_glVertexAttribP3uiv.?(arg0, arg1, arg2, arg3);
}
pub const GL_UNIFORM_BUFFER_SIZE = 35370;
pub const GLFW_MOUSE_BUTTON_6 = 5;
pub const GL_UNSIGNED_SHORT_5_6_5 = 33635;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub inline fn glGetFloatv(arg0: GLenum, arg1: ?[*]GLfloat) void {
    return glad_glGetFloatv.?(arg0, arg1);
}
pub inline fn glGetError() GLenum {
    return glad_glGetError.?();
}
pub inline fn glIsVertexArray(arg0: GLuint) GLboolean {
    return glad_glIsVertexArray.?(arg0);
}
pub const GL_MAX_UNIFORM_BUFFER_BINDINGS = 35375;
pub const GLFW_OPENGL_API = 196609;
pub inline fn glVertexAttribI1i(arg0: GLuint, arg1: GLint) void {
    return glad_glVertexAttribI1i.?(arg0, arg1);
}
pub const GL_CLIP_DISTANCE7 = 12295;
pub const GLFW_KEY_U = 85;
pub const __INT8_FMTi__ = c"hhi";
pub inline fn glVertexAttrib4sv(arg0: GLuint, arg1: ?[*]const GLshort) void {
    return glad_glVertexAttrib4sv.?(arg0, arg1);
}
pub const GL_RGBA16_SNORM = 36763;
pub const SCNu16 = c"hu";
pub const GL_COLOR_ATTACHMENT30 = 36094;
pub const GL_COLOR_ATTACHMENT21 = 36085;
pub inline fn glUniform2uiv(arg0: GLint, arg1: GLsizei, arg2: ?[*]const GLuint) void {
    return glad_glUniform2uiv.?(arg0, arg1, arg2);
}
pub const GL_COLOR_ATTACHMENT10 = 36074;
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const GL_UNSIGNED_INT_SAMPLER_CUBE = 36308;
pub const GLFW_KEY_KP_2 = 322;
pub const GL_COMPILE_STATUS = 35713;
pub const GLFW_KEY_LEFT_BRACKET = 91;
pub const GLFW_MOUSE_BUTTON_8 = 7;
pub const GL_RENDERER = 7937;
pub inline fn glNormalP3uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glNormalP3uiv.?(arg0, arg1);
}
pub const GLFW_SRGB_CAPABLE = 135182;
pub const GL_FIRST_VERTEX_CONVENTION = 36429;
pub inline fn glDeleteFramebuffers(arg0: GLsizei, arg1: ?[*]const GLuint) void {
    return glad_glDeleteFramebuffers.?(arg0, arg1);
}
pub const GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 36269;
pub const GL_DEPTH24_STENCIL8 = 35056;
pub inline fn glGetShaderInfoLog(arg0: GLuint, arg1: GLsizei, arg2: ?[*]GLsizei, arg3: ?[*]GLchar) void {
    return glad_glGetShaderInfoLog.?(arg0, arg1, arg2, arg3);
}
pub const GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 36060;
pub inline fn glIsShader(arg0: GLuint) GLboolean {
    return glad_glIsShader.?(arg0);
}
pub const GLFW_FALSE = 0;
pub const GL_R8UI = 33330;
pub inline fn glDeleteProgram(arg0: GLuint) void {
    return glad_glDeleteProgram.?(arg0);
}
pub const GL_MAX_CLIP_DISTANCES = 3378;
pub const GL_NEAREST_MIPMAP_NEAREST = 9984;
pub inline fn glVertexAttribP1uiv(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: ?[*]const GLuint) void {
    return glad_glVertexAttribP1uiv.?(arg0, arg1, arg2, arg3);
}
pub const GL_TEXTURE_BINDING_CUBE_MAP = 34068;
pub const GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 2;
pub const GL_MAX_VIEWPORT_DIMS = 3386;
pub const INT_LEAST8_MAX = 127;
pub const __SIZEOF_POINTER__ = 8;
pub const __TIMER_T_TYPE = [*]void;
pub const __unix = 1;
pub const GL_STENCIL = 6146;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const GL_TEXTURE = 5890;
pub const GL_TEXTURE_DEPTH_SIZE = 34890;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const PRIu16 = c"u";
pub const GL_INT_2_10_10_10_REV = 36255;
pub const GLFW_JOYSTICK_5 = 4;
pub inline fn glGetActiveUniform(arg0: GLuint, arg1: GLuint, arg2: GLsizei, arg3: ?[*]GLsizei, arg4: ?[*]GLint, arg5: ?[*]GLenum, arg6: ?[*]GLchar) void {
    return glad_glGetActiveUniform.?(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}
pub const __k8__ = 1;
pub inline fn glMultiTexCoordP3uiv(arg0: GLenum, arg1: GLenum, arg2: ?[*]const GLuint) void {
    return glad_glMultiTexCoordP3uiv.?(arg0, arg1, arg2);
}
pub const __unix__ = 1;
pub inline fn glUniformBlockBinding(arg0: GLuint, arg1: GLuint, arg2: GLuint) void {
    return glad_glUniformBlockBinding.?(arg0, arg1, arg2);
}
pub const __LDBL_HAS_INFINITY__ = 1;
pub const GL_TEXTURE_ALPHA_TYPE = 35859;
pub const GL_COMPRESSED_RGB = 34029;
pub const __GNU_LIBRARY__ = 6;
pub const __FLT_MIN_10_EXP__ = -37;
pub const __UINTPTR_FMTo__ = c"lo";
pub const GLFW_KEY_BACKSLASH = 92;
pub const GLFW_KEY_F4 = 293;
pub inline fn glFramebufferTexture(arg0: GLenum, arg1: GLenum, arg2: GLuint, arg3: GLint) void {
    return glad_glFramebufferTexture.?(arg0, arg1, arg2, arg3);
}
pub const GL_RIGHT = 1031;
pub const GL_UNPACK_ROW_LENGTH = 3314;
pub const GL_MAX_ARRAY_TEXTURE_LAYERS = 35071;
pub const GL_COLOR_ATTACHMENT4 = 36068;
pub inline fn glVertexAttribP4ui(arg0: GLuint, arg1: GLenum, arg2: GLboolean, arg3: GLuint) void {
    return glad_glVertexAttribP4ui.?(arg0, arg1, arg2, arg3);
}
pub const SCNo16 = c"ho";
pub const PRIxLEAST16 = c"x";
pub const GL_MAP_INVALIDATE_BUFFER_BIT = 8;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const GL_UNSIGNED_SHORT_1_5_5_5_REV = 33638;
pub inline fn glGetBooleani_v(arg0: GLenum, arg1: GLuint, arg2: ?[*]GLboolean) void {
    return glad_glGetBooleani_v.?(arg0, arg1, arg2);
}
pub const SCNx16 = c"hx";
pub const GL_RGB8 = 32849;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = 36310;
pub const GL_SAMPLER_CUBE_SHADOW = 36293;
pub const UINT_FAST32_MAX = c_ulong(18446744073709551615);
pub const GL_R11F_G11F_B10F = 35898;
pub inline fn glUniformMatrix4fv(arg0: GLint, arg1: GLsizei, arg2: GLboolean, arg3: ?[*]const GLfloat) void {
    return glad_glUniformMatrix4fv.?(arg0, arg1, arg2, arg3);
}
pub const GL_TEXTURE_SAMPLES = 37126;
pub const GL_RED = 6403;
pub const __UINT16_FMTx__ = c"hx";
pub const SCNx32 = c"x";
pub const __UINTPTR_FMTu__ = c"lu";
pub inline fn glRenderbufferStorageMultisample(arg0: GLenum, arg1: GLsizei, arg2: GLenum, arg3: GLsizei, arg4: GLsizei) void {
    return glad_glRenderbufferStorageMultisample.?(arg0, arg1, arg2, arg3, arg4);
}
pub const GL_SAMPLE_COVERAGE_INVERT = 32939;
pub const GLFW_VERSION_MAJOR = 3;
pub const GL_MIN_PROGRAM_TEXEL_OFFSET = 35076;
pub const __linux__ = 1;
pub const GL_VERSION_1_5 = 1;
pub const GL_TEXTURE4 = 33988;
pub const __SYSCALL_WORDSIZE = 64;
pub const GL_COMPRESSED_RED_RGTC1 = 36283;
pub const GL_SAMPLER_CUBE = 35680;
pub const GL_R8I = 33329;
pub const GL_ONE_MINUS_DST_ALPHA = 773;
pub const GL_POLYGON_SMOOTH_HINT = 3155;
pub inline fn glGetSamplerParameterfv(arg0: GLuint, arg1: GLenum, arg2: ?[*]GLfloat) void {
    return glad_glGetSamplerParameterfv.?(arg0, arg1, arg2);
}
pub const GLFW_REPEAT = 2;
pub const GLFW_CLIENT_API = 139265;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const GL_DEPTH_STENCIL = 34041;
pub const GLFW_KEY_SCROLL_LOCK = 281;
pub const GLFW_KEY_KP_EQUAL = 336;
pub const GL_STENCIL_BACK_FUNC = 34816;
pub inline fn glClearStencil(arg0: GLint) void {
    return glad_glClearStencil.?(arg0);
}
pub const GLFW_KEY_N = 78;
pub const GLFW_KEY_RIGHT_ALT = 346;
pub const GL_UNPACK_SWAP_BYTES = 3312;
pub inline fn glCreateShader(arg0: GLenum) GLuint {
    return glad_glCreateShader.?(arg0);
}
pub const GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 36055;
pub const __WCHAR_MAX__ = 2147483647;
pub const GL_LINK_STATUS = 35714;
pub inline fn glColorMask(arg0: GLboolean, arg1: GLboolean, arg2: GLboolean, arg3: GLboolean) void {
    return glad_glColorMask.?(arg0, arg1, arg2, arg3);
}
pub inline fn glMultiTexCoordP2ui(arg0: GLenum, arg1: GLenum, arg2: GLuint) void {
    return glad_glMultiTexCoordP2ui.?(arg0, arg1, arg2);
}
pub const _BITS_STDINT_UINTN_H = 1;
pub const GL_BLEND_SRC_ALPHA = 32971;
pub inline fn glGetUniformiv(arg0: GLuint, arg1: GLint, arg2: ?[*]GLint) void {
    return glad_glGetUniformiv.?(arg0, arg1, arg2);
}
pub const GL_SAMPLE_COVERAGE_VALUE = 32938;
pub inline fn glTexCoordP2uiv(arg0: GLenum, arg1: ?[*]const GLuint) void {
    return glad_glTexCoordP2uiv.?(arg0, arg1);
}
pub const __UINTMAX_FMTX__ = c"lX";
pub const GL_PRIMITIVE_RESTART = 36765;
pub const GLFW_OPENGL_DEBUG_CONTEXT = 139271;
pub const GL_LOWER_LEFT = 36001;
pub const GL_FLOAT_MAT2x3 = 35685;
pub const GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 36263;
pub const GL_COLOR_LOGIC_OP = 3058;
pub const GLFW_HRESIZE_CURSOR = 221189;
pub const gladGLversionStruct = struct_gladGLversionStruct;
pub const __GLsync = struct___GLsync;
pub const _cl_context = struct__cl_context;
pub const _cl_event = struct__cl_event;
