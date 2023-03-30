vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO vt4a2h/fl
  REF 79a053b1e4fb31871c8f3754db1716edab824395
  SHA512 4cad3413bff74c1636593e336ef9e0595a1ceba0bd9647b51f7c527ad9005dfb1629cb4c1eb4f6b9b64d48e2faa173b75b69d5134a3e02a9824d2e2490515f7b
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(PACKAGE_NAME fl CONFIG_PATH lib/cmake/${PACKAGE_NAME})


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
