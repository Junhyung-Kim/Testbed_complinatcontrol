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
include CMakeFiles/dyros_red_ethercat.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dyros_red_ethercat.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dyros_red_ethercat.dir/flags.make

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o: CMakeFiles/dyros_red_ethercat.dir/flags.make
CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o: ../red_ec_master.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o -c /home/dyros/dyros_red_ethercat_master/red_ec_master.cpp

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dyros/dyros_red_ethercat_master/red_ec_master.cpp > CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.i

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dyros/dyros_red_ethercat_master/red_ec_master.cpp -o CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.s

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.requires:

.PHONY : CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.requires

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.provides: CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.requires
	$(MAKE) -f CMakeFiles/dyros_red_ethercat.dir/build.make CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.provides.build
.PHONY : CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.provides

CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.provides.build: CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o


# Object files for target dyros_red_ethercat
dyros_red_ethercat_OBJECTS = \
"CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o"

# External object files for target dyros_red_ethercat
dyros_red_ethercat_EXTERNAL_OBJECTS =

libdyros_red_ethercat.a: CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o
libdyros_red_ethercat.a: CMakeFiles/dyros_red_ethercat.dir/build.make
libdyros_red_ethercat.a: CMakeFiles/dyros_red_ethercat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libdyros_red_ethercat.a"
	$(CMAKE_COMMAND) -P CMakeFiles/dyros_red_ethercat.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dyros_red_ethercat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dyros_red_ethercat.dir/build: libdyros_red_ethercat.a

.PHONY : CMakeFiles/dyros_red_ethercat.dir/build

CMakeFiles/dyros_red_ethercat.dir/requires: CMakeFiles/dyros_red_ethercat.dir/red_ec_master.cpp.o.requires

.PHONY : CMakeFiles/dyros_red_ethercat.dir/requires

CMakeFiles/dyros_red_ethercat.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dyros_red_ethercat.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dyros_red_ethercat.dir/clean

CMakeFiles/dyros_red_ethercat.dir/depend:
	cd /home/dyros/dyros_red_ethercat_master/build_debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dyros/dyros_red_ethercat_master /home/dyros/dyros_red_ethercat_master /home/dyros/dyros_red_ethercat_master/build_debug /home/dyros/dyros_red_ethercat_master/build_debug /home/dyros/dyros_red_ethercat_master/build_debug/CMakeFiles/dyros_red_ethercat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dyros_red_ethercat.dir/depend

