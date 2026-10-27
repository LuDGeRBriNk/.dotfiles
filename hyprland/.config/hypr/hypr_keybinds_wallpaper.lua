local keys = require("hypr_keybindsvariables")

-- Set Backgrounds
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + comma",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh prev")
)

hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + period",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh next")
)

hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + slash",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh random")
)
