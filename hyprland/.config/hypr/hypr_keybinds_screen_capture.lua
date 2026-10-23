-- Screen recording and capture functionalities

local keys = require("hypr_keybindsvariables")

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard only")) -- Region to Clipboard
hl.bind(
	keys.strongKey .. " + Print",
	hl.dsp.exec_cmd("hyprshot -m region -o ~/Records -f $(date +%Y-%m-%dT%H:%M:%S).png")
) -- Region to File
hl.bind(keys.lightKey .. " + Print", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only")) -- Window to Clipboard
hl.bind(
	keys.lightKey .. "+" .. keys.strongKey .. " + Print",
	hl.dsp.exec_cmd("hyprshot -m window -o ~/Records -f $(date +%Y-%m-%dT%H:%M:%S).png")
) -- Window to File

-- Recordings

-- Drawing on Screen (wayscribe)
hl.bind(keys.mainMod .. " + D", hl.dsp.exec_cmd("wayscriber --daemon-toggle"))
