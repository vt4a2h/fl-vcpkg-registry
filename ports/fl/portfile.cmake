vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO vt4a2h/fl
  REF 6a75d12bc1e5aeba3dfca108fcb8fc4940f2b0cc
  SHA512 5d19bf382291e1b9b1394554048774182d76aa1d7da8118a8fd21de416109a54c20d3bb558d6c2e1cb5ae9da562719e5d4388f48e94dada84abe59c8104ba213
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
