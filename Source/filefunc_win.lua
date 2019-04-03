-- Note to self: environment variables: set

-- These functions assume you're not on a school computer or anywhere where cmd is completely restricted.


-- We know we're on Windows for a start...
userprofile = os.getenv("USERPROFILE")

simplevvvvvvfolder = false
standardvvvvvvfolders = {
	display = "\\(My) Documents\\VVVVVV",
	folders = {
		"\\Documents\\VVVVVV",
		"\\My Documents\\VVVVVV"
	}
}


-- Some Windows constants
CP_UTF8 = 65001
FILE_ATTRIBUTE_DIRECTORY = 16
INVALID_FILE_ATTRIBUTES = 0xFFFFFFFF
INVALID_HANDLE_VALUE = -1
MAX_PATH = 260


local ffi = require("ffi")
ffi.cdef([[
	typedef unsigned short WORD, *PWORD, *LPWORD;
	typedef unsigned long DWORD, *PDWORD, *LPDWORD;
	typedef bool BOOL, *PBOOL, *LPBOOL;
	typedef unsigned int UINT;
	typedef void* HANDLE;
	typedef char CHAR, *PCHAR;
	typedef char* PSTR, *LPSTR;
	typedef const char* LPCSTR;
	typedef wchar_t WCHAR, *PWCHAR;
	typedef wchar_t* LPWSTR, *PWSTR;
	typedef const wchar_t* LPCWSTR;

	typedef LPCSTR LPCCH;
	typedef LPCWSTR LPCWCH;

	typedef struct _FILETIME {
	  DWORD dwLowDateTime;
	  DWORD dwHighDateTime;
	} FILETIME, *PFILETIME, *LPFILETIME;

	typedef struct _WIN32_FIND_DATAW {
	  DWORD    dwFileAttributes;
	  FILETIME ftCreationTime;
	  FILETIME ftLastAccessTime;
	  FILETIME ftLastWriteTime;
	  DWORD    nFileSizeHigh;
	  DWORD    nFileSizeLow;
	  DWORD    dwReserved0;
	  DWORD    dwReserved1;
	  WCHAR    cFileName[260];
	  WCHAR    cAlternateFileName[14];
	  DWORD    dwFileType;
	  DWORD    dwCreatorType;
	  WORD     wFinderFlags;
	} WIN32_FIND_DATAW, *PWIN32_FIND_DATAW, *LPWIN32_FIND_DATAW;

	HANDLE FindFirstFileW(
	  LPCWSTR            lpFileName,
	  LPWIN32_FIND_DATAW lpFindFileData
	);

	BOOL FindNextFileW(
	  HANDLE             hFindFile,
	  LPWIN32_FIND_DATAW lpFindFileData
	);

	BOOL FindClose(
	  HANDLE hFindFile
	);

	typedef struct _SYSTEMTIME {
	  WORD wYear;
	  WORD wMonth;
	  WORD wDayOfWeek;
	  WORD wDay;
	  WORD wHour;
	  WORD wMinute;
	  WORD wSecond;
	  WORD wMilliseconds;
	} SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;

	BOOL FileTimeToSystemTime(
	  const FILETIME *lpFileTime,
	  LPSYSTEMTIME   lpSystemTime
	);

	typedef void TIME_ZONE_INFORMATION;

	BOOL SystemTimeToTzSpecificLocalTime(
	  const TIME_ZONE_INFORMATION *lpTimeZoneInformation,
	  const SYSTEMTIME            *lpUniversalTime,
	  LPSYSTEMTIME                lpLocalTime
	);

	DWORD GetFileAttributesW(
	  LPCWSTR lpFileName
	);

	/* UTF-8 -> UTF-16 */
	int MultiByteToWideChar(
	  UINT   CodePage,
	  DWORD  dwFlags,
	  LPCCH  lpMultiByteStr,
	  int    cbMultiByte,
	  LPWSTR lpWideCharStr,
	  int    cchWideChar
	);

	/* UTF-16 -> UTF-8 */
	int WideCharToMultiByte(
	  UINT   CodePage,
	  DWORD  dwFlags,
	  LPCWCH lpWideCharStr,
	  int    cchWideChar,
	  LPSTR  lpMultiByteStr,
	  int    cbMultiByte,
	  LPCCH  lpDefaultChar,
	  LPBOOL lpUsedDefaultChar
	);
]])


buffer_filedata = ffi.new("WIN32_FIND_DATAW")
buffer_st_utc = ffi.new("SYSTEMTIME")
buffer_st_loc = ffi.new("SYSTEMTIME")
buffer_path_utf8 = ffi.new("CHAR[?]", MAX_PATH*4)
buffer_path_utf16 = ffi.new("WCHAR[?]", MAX_PATH)


function path_utf8_to_utf16(lua_str)
	ffi.C.MultiByteToWideChar(
		CP_UTF8, 0, lua_str, -1, buffer_path_utf16, MAX_PATH
	)
	return buffer_path_utf16
end

function path_utf16_to_utf8(wstr)
	ffi.C.WideCharToMultiByte(
		CP_UTF8, 0, wstr, -1, buffer_path_utf8, MAX_PATH*4, nil, nil
	)
	return ffi.string(buffer_path_utf8)
end

function file_attributes_directory(dwAttributes)
	return bit(dwAttributes, FILE_ATTRIBUTE_DIRECTORY)
end

function listfiles(directory)
	local t = {[""] = {}}

	-- We really can't have slashes here instead of backslashes, this is Windows.
	directory = directory:gsub("/", "\\")
	-- We can't have a trailing backslash either, or our matching system will blow up. This comes in the form of a double backslash.
	directory = directory:gsub("\\\\", "\\")

	local search_handle = ffi.C.FindFirstFileW(path_utf8_to_utf16(directory .. "\\*"), buffer_filedata)
	if tonumber(ffi.cast("intptr_t", search_handle)) == INVALID_HANDLE_VALUE then
		return t
	end
	local currentdir = ""
	local prefix = ""
	local directory_insertion_point = 1
	local subdirectories_left = {}
	local isdir
	local current_name
	local current_data
	local files_left = true
	while files_left do
		isdir = file_attributes_directory(buffer_filedata.dwFileAttributes)
		current_name = path_utf16_to_utf8(buffer_filedata.cFileName)
		if current_name ~= "." and current_name ~= ".." then
			if isdir then
				table.insert(subdirectories_left, prefix .. current_name)
			end

			if isdir or current_name:sub(-7, -1) == ".vvvvvv" then
				ffi.C.FileTimeToSystemTime(buffer_filedata.ftLastWriteTime, buffer_st_utc)
				ffi.C.SystemTimeToTzSpecificLocalTime(nil, buffer_st_utc, buffer_st_loc)

				current_data = {
					name = path_utf16_to_utf8(buffer_filedata.cFileName),
					isdir = isdir,
					result_shown = true,
					bu_lastmodified = 0,
					bu_overwritten = 0,
					lastmodified = {
						buffer_st_loc.wYear, buffer_st_loc.wMonth, buffer_st_loc.wDay,
						buffer_st_loc.wHour, buffer_st_loc.wMinute, buffer_st_loc.wSecond
					},
				}

				if isdir then
					-- Group directories first
					table.insert(t[currentdir], directory_insertion_point, current_data)
					directory_insertion_point = directory_insertion_point + 1
				else
					table.insert(t[currentdir], current_data)
				end
			end
		end
		files_left = ffi.C.FindNextFileW(search_handle, buffer_filedata)
		if not files_left and #subdirectories_left > 0 then
			ffi.C.FindClose(search_handle)

			currentdir = table.remove(subdirectories_left, 1)
			prefix = currentdir .. "\\"
			directory_insertion_point = 1

			t[currentdir] = {}

			search_handle = ffi.C.FindFirstFileW(
				path_utf8_to_utf16(directory .. "\\" .. prefix .. "*"),
				buffer_filedata
			)

			files_left = true
		end
	end
	ffi.C.FindClose(search_handle)
	return t
end

function getlevelsfolder(ignorecustom)
	-- Returns success, path

	if s.customvvvvvvdir == "" or ignorecustom then
		-- Spawn less cmd windows
		if directory_exists(userprofile .. standardvvvvvvfolders.folders[1], "levels") then
			return true, userprofile .. standardvvvvvvfolders.folders[1] .. "\\levels"
		elseif directory_exists(userprofile .. standardvvvvvvfolders.folders[2], "levels") then
			return true, userprofile .. standardvvvvvvfolders.folders[2] .. "\\levels"
		else
			-- Also return what it should have been
			return false, userprofile .. standardvvvvvvfolders.display .. "\\levels"
		end
	else
		-- The user has supplied a custom directory.
		if directory_exists(s.customvvvvvvdir, "levels") then
			-- Fair enough
			return true, s.customvvvvvvdir .. "\\levels"
		else
			-- What are you doing?
			return false, s.customvvvvvvdir .. "\\levels"
		end
	end
end

function listdirs(directory)
	-- Currently unused, except in a testing state
	local t = {}
	-- Only do folders.
	local pfile = io.popen('dir "' .. escapename(directory) .. '" /b /ad')
	for filename in pfile:lines() do
		table.append(t, filename)
	end
	pfile:close()
	return t
end

function directory_exists(where, what)
	local dwAttributes = ffi.C.GetFileAttributesW(path_utf8_to_utf16(where .. "\\" .. what))

	return dwAttributes ~= INVALID_FILE_ATTRIBUTES and file_attributes_directory(dwAttributes)
end

function readlevelfile(path)
	-- returns success, contents

	local fh, everr = io.open(path, "r")

	if fh == nil then
		return false, everr
	end

	local ficontents = fh:read("*a")

	fh:close()

	return true, ficontents
end

function writelevelfile(path, contents)
	-- returns success, (if not) error message
	if path:sub(3):match(".*[:%*%?\"<>|].*") ~= nil then
		return false, L.INVALIDFILENAME_WIN
	end

	local fh, everr = io.open(path, "w")

	if fh == nil then
		return false, everr
	end

	local ficontents = fh:write(contents)

	fh:close()

	return true, nil
end

function getmodtime(fullpath)
	local pfile = io.popen(
		escapename(
			love.filesystem.getSaveDirectory():gsub(
				escapegsub(love.filesystem.getAppdataDirectory(), true),
				"%%appdata%%"
			):gsub("/", "\\")
		) .. '\\available_utils\\fileunix.exe "' .. escapename(fullpath) .. '"'
	)
	local modtime = pfile:read("*a")
	pfile:close()
	return modtime
end

function readimage(levelsfolder, filename)
	-- returns success, contents

	local fh, everr = io.open(levelsfolder:sub(1, -8) .. "\\graphics\\" .. filename, "rb")

	if fh == nil then
		return false, everr
	end

	local ficontents = fh:read("*a")

	fh:close()

	return true, ficontents
end

function util_folderopendialog()
	-- love.filesystem.getSaveDirectory() = C:/Users/David/AppData/Roaming/LOVE/ved
	os.execute(love.filesystem.getSaveDirectory():gsub("/", "\\") .. "\\utils\\folderopendialog.exe")
end

function escapename(name)
	-- Windows doesn't allow all sorts of characters in filenames, which is nice for programmers using the command line and can be annoying for users.
	return name:gsub('"', "")
end
