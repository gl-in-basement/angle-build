export PATH=$PWD/depot_tools:$PATH
echo "Building angle"
cd angle
python scripts/bootstrap.py
gclient sync
git checkout main
patch -i ../patches/Build-Static-Library.patch
patch -i ../patches/Disable-Thin-Library.patch
gn gen out/Release --args='is_debug=false is_clang=true is_component_build=false angle_assert_always_on=true enable_thin_archive=false'
autoninja -C out/Release
# packaging
mkdir dist
cp out/Release/obj/*static.lib ./dist/
llvm-ar rcs dist/libc++.lib out/Release/obj/buildtools/third_party/libc++/libc++/*.obj
mkdir dist/vulkan-support
cp -r out/Release/{vk_swiftshader_icd.json,\
vk_swiftshader.dll,\
VkICD_mock_icd.dll,\
VkLayer_khronos_validation.dll,\
angledata} dist/vulkan-support
tar -czvf angle-windows-x64.tar.gz -C dist .
