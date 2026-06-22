local function wallpaper_util(wallpaper_path)
    local ext = wallpaper_path:lower():match("^.+%.([a-z0-9]+)$")
  
    if ext == "mp4" or ext == "mkv" or ext == "webm" or ext == "mov" then
      return string.format(
        'mpvpaper ALL "%s" --mpv-options="loop-file=inf no-audio"',
        wallpaper_path
      )
    end
  
    return string.format(
      'mpvpaper '*' "%s"',
      wallpaper_path
    )
  end

return {
    terminal = "ghostty",
    file_manager = "dolphin",
    screen_shot_cmd = "hyprshot -m region -o ~/Pictures/Screenshots",
    menu = "rofi -show drun",
    wallpaper_cmd = wallpaper_util("/home/river/Videos/Wallpapers/Wallpaper.mp4"),
    browser = "brave",
    bar_cmd = "qs"
}