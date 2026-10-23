local keys = require("hypr_keybindsvariables")

-- WINDOWS MANAGEMENT
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + mouse:272", hl.dsp.window.float({ action = "toggle" }))
hl.bind(keys.mainMod .. "+" .. keys.strongKey .. " + mouse:272", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(keys.mainMod .. "+" .. keys.strongKey .. " + mouse:273", hl.dsp.layout("togglesplit"))
hl.bind(keys.mainMod .. " + J", hl.dsp.layout("togglesplit")) -- asme as above but with keyboard

hl.bind(keys.mainMod .. " + P", hl.dsp.window.pseudo()) -- Same as above with keyboard

-- Move/resize windows with keys.mainMod + LMB/RMB and dragging
hl.bind(keys.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(keys.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with keys.mainMod + keys.lightKey + arrows
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ right",
	hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ left",
	hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ up",
	hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ down",
	hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
	{ repeating = true }
)

-- Resize windows with keys.mainMod + keys.lightKey + HJKL (vim keys)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ L",
	hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ H",
	hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ K",
	hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
	{ repeating = true }
)
hl.bind(
	keys.mainMod .. "+" .. keys.lightKey .. "+ J",
	hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
	{ repeating = true }
)

-- Move focus across windows with keys.mainMod + arrow keys and HJKL keys
hl.bind(keys.mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(keys.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(keys.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(keys.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(keys.mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(keys.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(keys.mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(keys.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
