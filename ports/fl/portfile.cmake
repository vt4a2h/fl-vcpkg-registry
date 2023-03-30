vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO vt4a2h/fl
  REF a57da71321970d0368e9f11fbd6df70e12284400
  SHA512 d54c9d3160d93897cda0d5795d52f2b9e59a90c2f01c0413926b2d7f61217db6feda3b28efc4841f63d4dbafa2594e549641d2a4edc4a0c6de86a513d4f758b9
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PACKAGE_NAME})


file(REMOVE_RECURSE
  "${CURRENT_PACKAGES_DIR}/debug/include"
  "${CURRENT_PACKAGES_DIR}/debug/lib"
  "${CURRENT_PACKAGES_DIR}/lib"
  "${CURRENT_PACKAGES_DIR}/debug"
)

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)
