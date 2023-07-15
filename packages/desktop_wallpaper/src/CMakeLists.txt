# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(desktop_wallpaper_library VERSION 0.0.1 LANGUAGES C)

add_library(desktop_wallpaper SHARED
  "desktop_wallpaper.c"
)

set_target_properties(desktop_wallpaper PROPERTIES
  PUBLIC_HEADER desktop_wallpaper.h
  OUTPUT_NAME "desktop_wallpaper"
)

target_compile_definitions(desktop_wallpaper PUBLIC DART_SHARED_LIB)
