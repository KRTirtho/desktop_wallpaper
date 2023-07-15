import 'package:desktop_wallpaper/src/bridge_generated.dart';
import 'package:desktop_wallpaper/src/ffi.dart';

DesktopWallpaper? _lib;
DesktopWallpaper get lib {
  if (_lib == null) {
    throw Exception('DesktopWallpaper library is not initialized');
  }
  return _lib!;
}

abstract class Wallpaper {
  static void initialize() {
    if (_lib != null) return;
    _lib = createLib();
  }

  static Future<String> get() {
    return lib.getWallpaper();
  }

  static Future<void> set(String path) {
    return lib.setWallpaper(path: path);
  }

  static Future<void> setMode(WallpaperMode mode) {
    return lib.setMode(mode: mode);
  }
}
