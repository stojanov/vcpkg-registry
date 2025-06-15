
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stojanov/async
    SHA512 63e59c77f6063fcad768b1d4c52eaa1281de1e14e623bd6236cd2c7eef8f57201e17c2e71addea04c758f9c062b0e4da24c3817b6906e2ffbebccf2c07f1231a
    REF 570d453e73347c01265710085849d0e552f8b105
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()
vcpkg_fixup_cmake_targets()
