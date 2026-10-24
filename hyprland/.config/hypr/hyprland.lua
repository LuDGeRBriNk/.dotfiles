-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Get rid of factory-settings useless stuff
hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true, -- Remove splash string - Notice hyprpaper requires this disabling elsewhere.
	},
})

-- Enable/Disable error logs:
debug.disable_logs = false
debug.gl_debugging = false

---- Variables & Hardware ----
require("hypr_env")
require("hypr_programs")
require("hypr_monitors")
require("hypr_input")
require("hypr_permissions")

---- Visuals & Layout ----
require("hypr_looks")
require("hypr_layouts")

---- Workspaces and Windows Rules ----
require("hypr_workspacerules")
require("hypr_windowrules")

---- Keybinds ----

require("hypr_keybinds_multimediakeys")
require("hypr_keybinds_system")
require("hypr_keybinds_programs")
require("hypr_keybinds_workspaces")
require("hypr_keybinds_windows")
require("hypr_keybinds_screen_capture")

require("hypr_autostart")
