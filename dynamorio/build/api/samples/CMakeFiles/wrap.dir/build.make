# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build

# Include any dependencies generated for this target.
include api/samples/CMakeFiles/wrap.dir/depend.make

# Include the progress variables for this target.
include api/samples/CMakeFiles/wrap.dir/progress.make

# Include the compile flags for this target's objects.
include api/samples/CMakeFiles/wrap.dir/flags.make

api/samples/CMakeFiles/wrap.dir/wrap.c.o: api/samples/CMakeFiles/wrap.dir/flags.make
api/samples/CMakeFiles/wrap.dir/wrap.c.o: ../api/samples/wrap.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object api/samples/CMakeFiles/wrap.dir/wrap.c.o"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS)  -DX86_64 -DLINUX -DUSE_VISIBILITY_ATTRIBUTES  -m64 -std=gnu99 -fno-strict-aliasing -fno-stack-protector -fvisibility=internal -O3 -g3 -Wall -Werror -Wwrite-strings -Wno-unused-but-set-variable -O2 -fno-stack-protector -o CMakeFiles/wrap.dir/wrap.c.o   -c /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/api/samples/wrap.c

api/samples/CMakeFiles/wrap.dir/wrap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wrap.dir/wrap.c.i"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS)  -DX86_64 -DLINUX -DUSE_VISIBILITY_ATTRIBUTES  -m64 -std=gnu99 -fno-strict-aliasing -fno-stack-protector -fvisibility=internal -O3 -g3 -Wall -Werror -Wwrite-strings -Wno-unused-but-set-variable -O2 -fno-stack-protector -E /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/api/samples/wrap.c > CMakeFiles/wrap.dir/wrap.c.i

api/samples/CMakeFiles/wrap.dir/wrap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wrap.dir/wrap.c.s"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS)  -DX86_64 -DLINUX -DUSE_VISIBILITY_ATTRIBUTES  -m64 -std=gnu99 -fno-strict-aliasing -fno-stack-protector -fvisibility=internal -O3 -g3 -Wall -Werror -Wwrite-strings -Wno-unused-but-set-variable -O2 -fno-stack-protector -S /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/api/samples/wrap.c -o CMakeFiles/wrap.dir/wrap.c.s

api/samples/CMakeFiles/wrap.dir/wrap.c.o.requires:
.PHONY : api/samples/CMakeFiles/wrap.dir/wrap.c.o.requires

api/samples/CMakeFiles/wrap.dir/wrap.c.o.provides: api/samples/CMakeFiles/wrap.dir/wrap.c.o.requires
	$(MAKE) -f api/samples/CMakeFiles/wrap.dir/build.make api/samples/CMakeFiles/wrap.dir/wrap.c.o.provides.build
.PHONY : api/samples/CMakeFiles/wrap.dir/wrap.c.o.provides

api/samples/CMakeFiles/wrap.dir/wrap.c.o.provides.build: api/samples/CMakeFiles/wrap.dir/wrap.c.o

# Object files for target wrap
wrap_OBJECTS = \
"CMakeFiles/wrap.dir/wrap.c.o"

# External object files for target wrap
wrap_EXTERNAL_OBJECTS =

api/samples/bin/libwrap.so: api/samples/CMakeFiles/wrap.dir/wrap.c.o
api/samples/bin/libwrap.so: api/samples/CMakeFiles/wrap.dir/build.make
api/samples/bin/libwrap.so: lib64/release/libdynamorio.so.4.1
api/samples/bin/libwrap.so: ext/lib64/release/libdrwrap.so
api/samples/bin/libwrap.so: ext/lib64/release/libdrmgr.so
api/samples/bin/libwrap.so: ext/lib64/release/libdrx.so
api/samples/bin/libwrap.so: ext/lib64/release/libdrcontainers.a
api/samples/bin/libwrap.so: lib64/release/libdynamorio.so.4.1
api/samples/bin/libwrap.so: api/samples/CMakeFiles/wrap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library bin/libwrap.so"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wrap.dir/link.txt --verbose=$(VERBOSE)
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && /usr/bin/cmake -E echo "Usage: pass to drconfig or drrun: -c /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples/bin/libwrap.so"

# Rule to build all files generated by this target.
api/samples/CMakeFiles/wrap.dir/build: api/samples/bin/libwrap.so
.PHONY : api/samples/CMakeFiles/wrap.dir/build

api/samples/CMakeFiles/wrap.dir/requires: api/samples/CMakeFiles/wrap.dir/wrap.c.o.requires
.PHONY : api/samples/CMakeFiles/wrap.dir/requires

api/samples/CMakeFiles/wrap.dir/clean:
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples && $(CMAKE_COMMAND) -P CMakeFiles/wrap.dir/cmake_clean.cmake
.PHONY : api/samples/CMakeFiles/wrap.dir/clean

api/samples/CMakeFiles/wrap.dir/depend:
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/api/samples /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/api/samples/CMakeFiles/wrap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : api/samples/CMakeFiles/wrap.dir/depend

