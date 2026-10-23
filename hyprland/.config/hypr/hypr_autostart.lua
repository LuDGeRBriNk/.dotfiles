local programs = require("hypr_programs")

hl.on("hyprland.start", function()
	-- Top Bar
	hl.exec_cmd("bash -c killall waybar; waybar")

	-- Wallpaper
	hl.exec_cmd("bash -c killall hyprpaper; hyprpaper & sleep 0.5; ~/.config/hypr/scripts/set-wallpaper.sh random")

	-- Hypridle
	hl.exec_cmd("bash -c killall hypridle; hypridle")

	-- Notifications
	hl.exec_cmd("bash -c killall swaync; swaync")

	-- polkitagent
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Sound effects
	hl.exec_cmd("bash -c killall easyeffects; easyeffects")

	-- Wayscriber to draw on screen
	hl.exec_cmd("bash -c killall wayscriber; wayscriber --daemon --no-tray")

	-- Start cliphist to watch for text and image copies
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Startup Apps
	hl.exec_cmd(programs.Browser)
end)

--hl.on("hyprland.shutdown", function ()

--end)
