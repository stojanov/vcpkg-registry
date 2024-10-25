
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO https://github.com/42dotmk/schism
    REF 9c2a35c5164970e5e7c6aaf38815b687b29b5045
    HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
