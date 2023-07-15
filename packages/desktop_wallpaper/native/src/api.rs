use wallpaper;

#[derive(Debug, Copy, Clone)]
pub enum WallpaperMode {
    Center,
    Crop,
    Fit,
    Span,
    Stretch,
    Tile,
}

pub fn get_wallpaper() -> String {
    wallpaper::get().unwrap()
}

pub fn set_wallpaper(path: String) {
    wallpaper::set_from_path(path.as_str()).unwrap();
}

pub fn set_mode(mode: WallpaperMode) {
    wallpaper::set_mode(match mode {
        WallpaperMode::Center => wallpaper::Mode::Center,
        WallpaperMode::Crop => wallpaper::Mode::Crop,
        WallpaperMode::Fit => wallpaper::Mode::Fit,
        WallpaperMode::Span => wallpaper::Mode::Span,
        WallpaperMode::Stretch => wallpaper::Mode::Stretch,
        WallpaperMode::Tile => wallpaper::Mode::Tile,
    })
    .unwrap();
}
