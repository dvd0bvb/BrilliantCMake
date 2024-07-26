include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/SanitizerOptions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/MsvcRuntime.cmake)

set(TEST_TARGET ${PROJECT_NAME}_TEST)

# TODO: add sources and dependencies here 
set(TEST_SOURCES
    # source 1
    # ...
    test.cpp
)
set(TEST_DEPENDENCIES
    # dep 1
    # ...
    ${PROJECT_NAME}
)

add_executable(
    ${TEST_TARGET}
    ${TEST_SOURCES}
)

target_include_directories(
    ${TEST_TARGET}
    PRIVATE 
        ${CMAKE_SOURCE_DIR}/include
)

target_compile_features(
    ${TEST_TARGET}
    PRIVATE
        ${THIS_CXX_VERSION}
)

target_compile_options(
    ${TEST_TARGET}
    PRIVATE 
        ${PROJECT_FLAGS}
)

target_link_options(
    ${PROJECT_NAME}
    PRIVATE
        ${PROJECT_LINK_FLAGS}
)

set_sanitizer_options(${TEST_TARGET})
set_msvc_runtime(${TEST_TARGET})

find_package(GTest REQUIRED)
# TODO: Add other find_package calls here

target_link_libraries(
    ${TEST_TARGET}
    PRIVATE
        GTest::gtest
        GTest::gtest_main
        ${TEST_DEPENDENCIES}
)

gtest_discover_tests(${TEST_TARGET})