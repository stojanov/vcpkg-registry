
# vcpkg_from_github(
#     OUT_SOURCE_PATH SOURCE_PATH
#     URL https://github.com/42dotmk/schism.git
#     REF 1e7b804173f5f65d10e292c2b0061cfb00cbb314
#     SHA512 0
#     HEAD_REF master
#     GIT_SUBMODULES ""
# )

# vcpkg_from_github(
#     OUT_SOURCE_PATH SOURCE_PATH
#     REPO 42dotmk/schism
#     REF 1e7b804173f5f65d10e292c2b0061cfb00cbb314
#     SHA512 a27fc6f9affae8876e90499fc451bf940aeacd066255d0f251611ebb7d6e7f31f29790d8e86233e38e582a4b86f7bedb4b7606ef8d1d4d7cd19870785b84345d
# )

# vcpkg_execute_required_process(
#     COMMAND ${GIT} submodule update --init
#     WORKING_DIRECTORY ${SOURCE_PATH}
# )

find_program(GIT git)

set(GIT_URL "https://github.com/42dotmk/schism.git")
set(GIT_REV "1e7b804173f5f65d10e292c2b0061cfb00cbb314")

set(DOWNLOAD_DIR "${DOWNLOADS}/_SCHISM_${GIT_REV}")
set(DEST_DIR "${DOWNLOAD_DIR}/schism.git")

set(BUILD_TREE_DIR "${CURRENT_BUILDTREES_DIR}/SCHISM_${GIT_REV}")

message(STATUS "BUILD DIR ${DOWNLOAD_DIR}")

if(NOT EXISTS "${BUILD_TREE_DIR}")
    message(STATUS "Cloning and getting submodules")
    vcpkg_execute_required_process(
        COMMAND ${GIT} clone --recursive ${GIT_URL} ${BUILD_TREE_DIR}
        WORKING_DIRECTORY ${DOWNLOADS}
        LOGNAME clone
    )
endif()

message(STATUS "Cloning done")

# if(NOT EXISTS "${BUILD_TREE_DIR}/src")
#     message(STATUS "Adding worktree")
#     vcpkg_execute_required_process(
#         COMMAND ${GIT} worktree add ${BUILD_TREE_DIR}/src ${GIT_REV}
#         WORKING_DIRECTORY ${DOWNLOAD_DIR}
#         LOGNAME worktree
#     )
# endif()

message(STATUS "Adding worktree done")
message(STATUS "BUILT TREE ${CURRENT_BUILDTREES_DIR}")

vcpkg_configure_cmake(
    SOURCE_PATH "${BUILD_TREE_DIR}"
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME "schism")

vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)


