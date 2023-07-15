import 'package:desktop_wallpaper/src/bridge_generated.dart';

/// Represents the external library for desktop_wallpaper
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

DesktopWallpaper createWrapperImpl(ExternalLibrary lib) =>
    throw UnimplementedError();

Object createLibraryImpl() => throw UnimplementedError();
