
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stojanov/async
    SHA512 af7b2ed6b3b9079548e8ef0b0a0416bae537f0addcdaee99f7663df2cd904c1080a20d85706e4538ac411165960a5d5f790ab2c2a8ba57efb7665c9965021100
    REF acf222ade6e38dd30285450926dacf097a050995
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)

vcpkg_cmake_install()

