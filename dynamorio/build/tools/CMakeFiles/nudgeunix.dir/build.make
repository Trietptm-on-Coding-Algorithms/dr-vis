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
include tools/CMakeFiles/nudgeunix.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/nudgeunix.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/nudgeunix.dir/flags.make

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o: tools/CMakeFiles/nudgeunix.dir/flags.make
tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o: ../tools/nudgeunix.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/nudgeunix.dir/nudgeunix.c.o   -c /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/tools/nudgeunix.c

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nudgeunix.dir/nudgeunix.c.i"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/tools/nudgeunix.c > CMakeFiles/nudgeunix.dir/nudgeunix.c.i

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nudgeunix.dir/nudgeunix.c.s"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/tools/nudgeunix.c -o CMakeFiles/nudgeunix.dir/nudgeunix.c.s

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.requires:
.PHONY : tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.requires

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.provides: tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.requires
	$(MAKE) -f tools/CMakeFiles/nudgeunix.dir/build.make tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.provides.build
.PHONY : tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.provides

tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.provides.build: tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o: tools/CMakeFiles/nudgeunix.dir/flags.make
tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o: ../core/unix/nudgesig.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o   -c /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/core/unix/nudgesig.c

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.i"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/core/unix/nudgesig.c > CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.i

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.s"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/core/unix/nudgesig.c -o CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.s

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.requires:
.PHONY : tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.requires

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.provides: tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.requires
	$(MAKE) -f tools/CMakeFiles/nudgeunix.dir/build.make tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.provides.build
.PHONY : tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.provides

tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.provides.build: tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o

# Object files for target nudgeunix
nudgeunix_OBJECTS = \
"CMakeFiles/nudgeunix.dir/nudgeunix.c.o" \
"CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o"

# External object files for target nudgeunix
nudgeunix_EXTERNAL_OBJECTS =

bin64/nudgeunix: tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o
bin64/nudgeunix: tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o
bin64/nudgeunix: tools/CMakeFiles/nudgeunix.dir/build.make
bin64/nudgeunix: tools/CMakeFiles/nudgeunix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ../bin64/nudgeunix"
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nudgeunix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/nudgeunix.dir/build: bin64/nudgeunix
.PHONY : tools/CMakeFiles/nudgeunix.dir/build

tools/CMakeFiles/nudgeunix.dir/requires: tools/CMakeFiles/nudgeunix.dir/nudgeunix.c.o.requires
tools/CMakeFiles/nudgeunix.dir/requires: tools/CMakeFiles/nudgeunix.dir/__/core/unix/nudgesig.c.o.requires
.PHONY : tools/CMakeFiles/nudgeunix.dir/requires

tools/CMakeFiles/nudgeunix.dir/clean:
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/nudgeunix.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/nudgeunix.dir/clean

tools/CMakeFiles/nudgeunix.dir/depend:
	cd /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/tools /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools /home/andrew/Dropbox/School/rcos/dr-vis/dynamorio/build/tools/CMakeFiles/nudgeunix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/nudgeunix.dir/depend

