local keys = require("hypr_keybindsvariables")

-- Set Backgrounds
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + left",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh prev")
)
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + H",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh prev")
)
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + right",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh next")
)
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + L",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh next")
)
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + up",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh random")
)
hl.bind(
	keys.mainMod .. "+" .. keys.strongKey .. " + K",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/set-wallpaper.sh random")
)

-- Switch workspaces with keys.mainMod + [0-9]
-- Move active window to a workspace with keys.mainMod + keys.lightKey + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 ≅ 0 (mod 10)
	hl.bind(keys.mainMod .. " + " .. key, hl.dsp.focus({ workspace = key + 1 })) -- +1 here because -1 is present in waybar
	hl.bind(keys.mainMod .. "+" .. keys.lightKey .. "+" .. key, hl.dsp.window.move({ workspace = key + 1 })) -- so that alternative monitor is at 0 ≅ 10
end

-- Example special workspace (scratchpad)
hl.bind(keys.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with keys.mainMod + scroll
hl.bind(keys.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(keys.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
