-- declaring shared local variables (globals are too much!)

local M = {}

M.Terminal = "kitty"

M.Menu = "wofi  --conf ~/.config/wofi/config/config --style ~/.config/wofi/themes/mocha/mocha-teal.css --show drun"
M.ClipboardMmenu =
	"cliphist list | wofi --conf ~/.config/wofi/config/config --style ~/.config/wofi/themes/mocha/mocha-teal.css --dmenu | cliphist decode | wl-copy"

M.FileManager = "thunar"
M.FileManagerCli = M.Terminal .. " -e ranger"

M.Browser = "firefox"
M.BrowserPrivate = "firefox -private-window"

M.CodeEditor = "code"
M.CodeEditorCli = M.Terminal .. " -e nvim"

M.TextEditor = M.Terminal .. " -e nvim"

M.Calculator = "qalculate-qt"
M.PasswordManager = "keepassxc"
M.SshClient = "termius"

return M
