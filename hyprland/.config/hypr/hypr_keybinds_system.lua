-- Hyprland, Systemd and other scripts...

local keys = require("hypr_keybindsvariables")

hl.bind(keys.mainMod .. "+" .. keys.strongKey .. "+" .. keys.lightKey .. " + escape", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. "+" .. keys.lightKey .. " + delete",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. "+" .. keys.lightKey .. " + backspace",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/restart-hypr-apps.sh reload")
)

hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + backspace",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/restart-hypr-apps.sh")
)

hl.bind(keys.mainMod .. "+" .. keys.strongKey .. " + Q", hl.dsp.window.close())
hl.bind(keys.mainMod .. " + backspace", hl.dsp.exec_cmd("hyprlock"))
hl.bind(keys.mainMod .. " + escape", hl.dsp.exec_cmd("~/scripts/dashboard.py"))
