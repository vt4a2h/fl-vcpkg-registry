vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO vt4a2h/fl
  REF 2f28bf41b93036a1d8565cf8db1ef56fc467be73
  SHA512 98738abfa9a59d846c1f3f2759339007e763cf28525fb62eeae6088d0b08de7989782f9561ea3f400b9cdf787f5a83c4e6ad1040ec24af892082d3022db8980a
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
