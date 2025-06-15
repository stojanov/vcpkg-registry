
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stojanov/async
    SHA512 af7b2ed6b3b9079548e8ef0b0a0416bae537f0addcdaee99f7663df2cd904c1080a20d85706e4538ac411165960a5d5f790ab2c2a8ba57efb7665c9965021100
    REF 570d453e73347c01265710085849d0e552f8b105
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

