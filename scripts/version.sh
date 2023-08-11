#!/bin/bash

CURR_VERSION=v`awk '/^version: /{print $2}' packages/desktop_wallpaper/pubspec.yaml`

# macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/desktop_wallpaper/macos/desktop_wallpaper.podspec

# CMake platforms (Linux, Windows)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/desktop_wallpaper/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/desktop_wallpaper/$CMAKE_PLATFORM/*.bak
done