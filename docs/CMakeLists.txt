include(${CMAKE_SOURCE_DIR}/cmake/Options.cmake)

find_package(Doxygen REQUIRED)

if(DOXYGEN_FOUND)
  set(DOXYGEN_USE_MDFILE_AS_MAINPAGE ${CMAKE_SOURCE_DIR}/README.md)
  # set(DOXYGEN_WARN_AS_ERROR FAIL_ON_WARNINGS_PRINT)
  set(DOXYGEN_WARN_LOGFILE dox_warnings.log)

  set(_DOXYGEN_INPUT ${CMAKE_SOURCE_DIR}/README.md ${CMAKE_SOURCE_DIR}/docs
                     ${CMAKE_SOURCE_DIR}/include
  )

  if(NOT BRILLIANT_CMAKE_BUILD_HEADER_ONLY)
    list(APPEND _DOXYGEN_INPUT ${CMAKE_SOURCE_DIR}/src)
  endif()

  doxygen_add_docs(${PROJECT_NAME}_DOCS ${_DOXYGEN_INPUT})
endif()
