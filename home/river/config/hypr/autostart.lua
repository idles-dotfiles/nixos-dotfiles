local config = require("variables.lua")

hl.on("hyprland.start", function () 
  hl.exec_cmd(config.terminal)
  hl.exec_cmd("nm-applet")
  hl.exec_cmd(config.wallpaper_cmd)
  hl.exec_cmd(config.bar_cmd)
end)