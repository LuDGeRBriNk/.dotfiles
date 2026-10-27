local keys = require("hypr_keybindsvariables")
local programs = require("hypr_programs")

hl.bind(keys.mainMod .. " + space", hl.dsp.exec_cmd(programs.Menu))
hl.bind(keys.mainMod .. " + V", hl.dsp.exec_cmd(programs.ClipboardMmenu))

hl.bind(keys.mainMod .. " + return", hl.dsp.exec_cmd(programs.Terminal, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + return", hl.dsp.exec_cmd(programs.Terminal, { float = false }))

hl.bind(keys.mainMod .. " + W", hl.dsp.exec_cmd(programs.CodeEditorCli, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + W", hl.dsp.exec_cmd(programs.CodeEditorCli, { float = false }))

hl.bind(keys.mainMod .. " + E", hl.dsp.exec_cmd(programs.CodeEditor, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + E", hl.dsp.exec_cmd(programs.CodeEditor, { float = false }))

hl.bind(keys.mainMod .. " + A", hl.dsp.exec_cmd(programs.FileManagerCli, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + A", hl.dsp.exec_cmd(programs.FileManagerCli, { float = false }))

hl.bind(keys.mainMod .. " + S", hl.dsp.exec_cmd(programs.FileManager, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + S", hl.dsp.exec_cmd(programs.FileManager, { float = false }))

hl.bind(keys.mainMod .. " + C", hl.dsp.exec_cmd(programs.Calculator, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + C", hl.dsp.exec_cmd(programs.Calculator, { float = false }))

hl.bind(keys.mainMod .. " + M", hl.dsp.exec_cmd(programs.PasswordManager, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + M", hl.dsp.exec_cmd(programs.PasswordManager, { float = false }))

hl.bind(keys.mainMod .. " + B", hl.dsp.exec_cmd(programs.Browser, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + B", hl.dsp.exec_cmd(programs.Browser, { float = false }))
hl.bind(keys.mainMod .. " + N", hl.dsp.exec_cmd(programs.BrowserPrivate, { float = true, size = { 800, 600 } }))
hl.bind(keys.mainMod .. "+" .. keys.lightKey .. " + N", hl.dsp.exec_cmd(programs.BrowserPrivate, { float = false }))
