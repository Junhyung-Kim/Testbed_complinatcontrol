# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dyros/dyros_red_ethercat_master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dyros/dyros_red_ethercat_master/build_debug

# Include any dependencies generated for this target.
include CMakeFiles/controller.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/controller.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/controller.dir/flags.make

CMakeFiles/controller.dir/controller.cpp.o: CMakeFiles/controller.dir/flags.make
CMakeFiles/controller.dir/controller.cpp.o: ../controller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/controller.dir/controller.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/controller.dir/controller.cpp.o -c /home/dyros/dyros_red_ethercat_master/controller.cpp

CMakeFiles/controller.dir/controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/controller.dir/controller.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dyros/dyros_red_ethercat_master/controller.cpp > CMakeFiles/controller.dir/controller.cpp.i

CMakeFiles/controller.dir/controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/controller.dir/controller.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dyros/dyros_red_ethercat_master/controller.cpp -o CMakeFiles/controller.dir/controller.cpp.s

CMakeFiles/controller.dir/controller.cpp.o.requires:

.PHONY : CMakeFiles/controller.dir/controller.cpp.o.requires

CMakeFiles/controller.dir/controller.cpp.o.provides: CMakeFiles/controller.dir/controller.cpp.o.requires
	$(MAKE) -f CMakeFiles/controller.dir/build.make CMakeFiles/controller.dir/controller.cpp.o.provides.build
.PHONY : CMakeFiles/controller.dir/controller.cpp.o.provides

CMakeFiles/controller.dir/controller.cpp.o.provides.build: CMakeFiles/controller.dir/controller.cpp.o


# Object files for target controller
controller_OBJECTS = \
"CMakeFiles/controller.dir/controller.cpp.o"

# External object files for target controller
controller_EXTERNAL_OBJECTS =

libcontroller.a: CMakeFiles/controller.dir/controller.cpp.o
libcontroller.a: CMakeFiles/controller.dir/build.make
libcontroller.a: CMakeFiles/controller.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libcontroller.a"
	$(CMAKE_COMMAND) -P CMakeFiles/controller.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/controller.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/controller.dir/build: libcontroller.a

.PHONY : CMakeFiles/controller.dir/build

CMakeFiles/controller.dir/requires: CMakeFiles/controller.dir/controller.cpp.o.requires

.PHONY : CMakeFiles/controller.dir/requires

CMakeFiles/controller.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/controller.dir/cmake_clean.cmake
.PHONY : CMakeFiles/controller.dir/clean

CMakeFiles/controller.dir/depend:
	cd /home/dyros/dyros_red_ethercat_master/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dyros/dyros_red_ethercat_master /home/dyros/dyros_red_ethercat_master /home/dyros/dyros_red_ethercat_master/build_debug /home/dyros/dyros_red_ethercat_master/build_debug /home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles/controller.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/controller.dir/depend

