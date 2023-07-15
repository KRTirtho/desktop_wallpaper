import 'package:desktop_wallpaper/src/bridge_generated.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

DesktopWallpaper? _wrapper;

DesktopWallpaper createLib() {
  _wrapper ??= createWrapperImpl(createLibraryImpl());
  return _wrapper!;
}