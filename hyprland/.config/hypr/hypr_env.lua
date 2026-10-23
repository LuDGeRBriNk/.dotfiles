-- Specify cursor, including for gtk apps
hl.env("HYPRCURSOR_THEME", "~/.local/share/icons/hyprcursors/themes/shareNordzy-hyprcursors-catppuccin-mocha-teal")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XCURSOR_THEME", "~/.local/share/icons/xcursors/themes/shareNordzy-hyprcursors-catppuccin-mocha-teal")
hl.env("XCURSOR_SIZE", 24)
--gsettings set org.gnome.desktop.interface cursor-theme 'THEME_NAME'

-- Force Qt to use qt5ct/qt6ct settings
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Force Qt apps to use Wayland (falling back to X11 if necessary)
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Enable automatic scaling for Qt apps
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Disable Qt's built-in window decorations (Hyprland draws its own borders)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Force GTK to use the dark theme
hl.env("GTK_THEME", "Adwaita:dark")
