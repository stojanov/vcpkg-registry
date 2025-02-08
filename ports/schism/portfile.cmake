
vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/42dotmk/schism.git
    REF 9c2a35c5164970e5e7c6aaf38815b687b29b5045
    SHA512 6b6d25034d379dca67e270dbe1229ab6b93e700442a25d6a7fec822d8d31943f8786e17cd62b58edd094376b9424a21b7019e0c21c29bc4deb540ea5c68bf6a5
    HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
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
