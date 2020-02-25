cmake_minimum_required (VERSION 3.1)

project (my_project)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)

set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include (NewLibrary)

find_package (Threads REQUIRED)

include_directories (${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory (hello)
add_subdirectory (world)

enable_testing ()
add_subdirectory (tests)
