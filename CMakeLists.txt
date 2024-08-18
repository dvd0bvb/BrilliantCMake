cmake_minimum_required(VERSION 3.27 FATAL_ERROR)

# prevent in source builds
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.\n")
endif()

# PROJECT_NAME is already defined by cmake after a project() call
# TODO: set the project name and cxx version
set(THIS_PROJECT_NAME "project")
set(THIS_CXX_VERSION cxx_std_23)

project(${THIS_PROJECT_NAME}
    VERSION 0.0.1
    LANGUAGES CXX
)

include(cmake/Options.cmake)

if (BRILLIANT_CMAKE_BUILD_HEADER_ONLY)
    add_subdirectory(include/${PROJECT_NAME})
else()
    add_subdirectory(src)
endif()

enable_testing()
add_subdirectory(test)
add_subdirectory(docs)