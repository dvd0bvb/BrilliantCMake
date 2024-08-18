include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)

set(GCC_ASAN_FLAGS -fsanitize=address,undefined -fno-omit-frame-pointer)
set(GCC_TSAN_FLAGS -fsanitize=thread -fPIE -pie)
set(GCC_MSAN_FLAGS
    -nostdinc++
    -nostdlib++
    -isystem
    ${BRILLIANT_CMAKE_MSAN_LIBCXX_INCLUDE_DIR}
    -fsanitize=memory
    -fsanitize-memory-track-origins
    -fPIE
    -pie
    -fno-omit-frame-pointer
)

set(ASAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=address>"
    "$<$<BOOL:${GCCISH}>:${GCC_ASAN_FLAGS}>"
    "$<$<BOOL:${CLANGISH}>:${GCC_ASAN_FLAGS}>"
)

set(TSAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=thread>"
    "$<$<BOOL:{GCCISH}>:${GCC_TSAN_FLAGS}>"
    "$<$<BOOL:{CLANGISH}>:${GCC_TSAN_FLAGS}>"
)

set(MSAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=memory>"
    "$<$<BOOL:${GCCISH}>:${GCC_MSAN_FLAGS}>"
    "$<$<BOOL:${CLANGISH}>:${GCC_MSAN_FLAGS}>"
)

function(set_sanitizer_options TARGET)
  get_property(
    LOCAL_SAN
    CACHE BRILLIANT_CMAKE_SANITIZER
    PROPERTY STRINGS
  )
  if(BRILLIANT_CMAKE_SANITIZER IN_LIST LOCAL_SAN)
    set(SAN_FLAGS
        "$<$<STREQUAL:${BRILLIANT_CMAKE_SANITIZER},ASAN>:${ASAN_FLAGS}>"
        "$<$<STREQUAL:${BRILLIANT_CMAKE_SANITIZER},TSAN>:${TSAN_FLAGS}>"
        "$<$<STREQUAL:${BRILLIANT_CMAKE_SANITIZER},MSAN>:${MSAN_FLAGS}>"
    )
    target_compile_options(${TARGET} PRIVATE ${SAN_FLAGS})
    target_link_options(${TARGET} PRIVATE ${SAN_FLAGS})
    if(BRILLIANT_CMAKE_SANITIZER STREQUAL "MSAN")
      target_link_libraries(${TARGET} PRIVATE c++ c++abi)
      target_link_directories(
        ${TARGET} PRIVATE ${BRILLIANT_CMAKE_MSAN_LIBCXX_LIB_DIR}
      )
    else()
      # target_link_options( ${TARGET} PRIVATE
      # "$<$<BOOL:${CLANGISH}>:-stdlib=libc++>"
      # ) target_link_libraries(${TARGET} PRIVATE c++ c++abi)
    endif()
  elseif(NOT BRILLIANT_CMAKE_SANITIZER STREQUAL "")
    message(
      FATAL_ERROR
        "The value of option BRILLIANT_CMAKE_SANITIZER is invalid: ${BRILLIANT_CMAKE_SANITIZER}"
    )
  endif()
endfunction()
