hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "intl",
        --kb_layout  = "br",
        --kb_variant = "abnt2",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Alienware 17R5 touchpad config:
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "synaptics-tm3394-001",
    sensitivity = 0.1,
})