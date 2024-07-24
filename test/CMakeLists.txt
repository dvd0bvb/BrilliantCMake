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

include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)
target_compile_options(
    ${TEST_TARGET}
    PRIVATE 
        ${PROJECT_WARNINGS}
)

set_property(TARGET ${TEST_TARGET} PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")

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

include(${CMAKE_SOURCE_DIR}/cmake/SanitizerOptions.cmake)
set_sanitizer_options(${TEST_TARGET})