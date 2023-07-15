import 'dart:ffi';
import 'dart:io';

import 'package:desktop_wallpaper/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

DesktopWallpaper createWrapperImpl(ExternalLibrary dylib) =>
    DesktopWallpaperImpl(dylib);

DynamicLibrary createLibraryImpl() {
  const base = 'desktop_wallpaper';

  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.executable();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}
