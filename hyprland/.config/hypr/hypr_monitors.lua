-- Main Laptop Monitor:
hl.monitor({ output = "eDP-1", mode = "2560x1440@120", position = "auto", scale = "auto"})
hl.monitor({ output = "eDP-2", mode = "2560x1440@120", position = "auto", scale = "auto"})
hl.monitor({ output = "eDP-3", mode = "2560x1440@120", position = "auto", scale = "auto"})

-- LG side monitor:
hl.monitor({
    output   = "HDMI-A-3",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "auto"
})

-- Random monitor plugin:
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })