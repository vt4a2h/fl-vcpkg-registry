vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO vt4a2h/fl
  REF 0e66c5b0784158f5aad69dff6eafad1cb28f4832
  SHA512 8fc236fb25a33505b2716a0ae5ca5e3760e5b26ee553de97dfa83110b1481117a20151ef265367d1a50020407bf42f2698d4e79b717e6834d893c9b2c04b82e2
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
