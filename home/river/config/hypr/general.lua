local theme = require("themes")

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = theme.primary,
            inactive_border = theme.secondary,
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    }
})