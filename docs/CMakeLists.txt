add_custom_target(${PROJECT_NAME}_DOCS
    COMMAND doxygen -q ${CMAKE_SOURCE_DIR}/Doxyfile
)