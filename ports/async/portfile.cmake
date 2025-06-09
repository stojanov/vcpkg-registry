
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stojanov/async
    SHA512 0 
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)

vcpkg_cmake_install()

