#!/bin/bash
echo "Packaging"
# packaging
cd angle
mkdir dist
cp out/Release/obj/*.lib ./dist/
llvm-ar rcs dist/libc++.lib out/Release/obj/buildtools/third_party/libc++/libc++/*.obj
mkdir dist/vulkan-support
cp -r out/Release/{vk_swiftshader_icd.json,\
vk_swiftshader.dll,\
VkICD_mock_icd.dll,\
VkLayer_khronos_validation.dll,\
angledata} dist/vulkan-support
tar -czvf angle-windows-x64-msvc.tar.gz -C dist .
