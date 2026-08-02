local function wallpaper_util(wallpaper_path)
	local ext = wallpaper_path:lower():match("^.+%.([a-z0-9]+)$")

	if ext == "mp4" or ext == "mkv" or ext == "webm" or ext == "mov" then
		return string.format('mpvpaper ALL "%s" --mpv-options="loop-file=inf no-audio"', wallpaper_path)
	end

	return string.format('awww-daemon & awww img "%s"', wallpaper_path)
end

return {
	terminal = "ghostty",
	file_manager = "dolphin",
	screen_shot_cmd = "hyprshot -m region -o ~/Pictures/Screenshots",
	menu = "rofi -show drun",
	wallpaper_cmd = wallpaper_util("/home/river/Pictures/Wallpapers/bg.png"),
	browser = "helium",
	bar_cmd = "waybar",
}
