include(GNUInstallDirs)

function(new_library name version)
    add_library("${name}" ${ARGV})

    set_target_properties("${name}" PROPERTIES DEFINE_SYMBOL "$<UPPER_CASE:${name}>_BUILD")

    get_target_property(lib_type "${name}" TYPE)
    string(TOUPPER "${name}_${lib_type}" LIBRARY_TYPE)

    configure_file(${CMAKE_CURRENT_LIST_DIR}/config.hxx.in config.hxx)

    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/config.hxx 
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${name})
    install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
            FILES_MATCHING REGEX "^.*\.(hxx|txx|ixx)$")
    install(TARGETS ${name}
            DESTINATION ${CMAKE_INTSALL_LIBDIR})
endfunction()
