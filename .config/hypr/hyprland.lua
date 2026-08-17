-- Monitor config
-- run `hyprctl monitors all` to see all monitors

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@164.95",
    position = "0x0",
    scale = "1",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("qs")
end)

-- Default programs
local terminal = "kitty"
local fileManager = "lf"
local menu = "wofi --show drun"

-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "miku-cursor-linux")
hl.env("HYPRCURSOR_THEME", "miku-cursor-linux")

-- Input configs
-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "abnt2",
        follow_mouse = 1,
        sensitivity = 0,
    },

    cursor = {
        no_hardware_cursors = true,
    },
    
    animations = {
        enabled = true,
    },

    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,
        col = {
            active_border = "rgb(18,18,18)",
            inactive_border = "rgb(18,18,18)",
        },
        resize_on_border = true,
        layout = "dwindle",

        -- https://wiki.hyprland.org/Configuring/Tearing/
        allow_tearing = false,
    },
    
    decoration = {
        rounding = 12,
        active_opacity = 1.0,
        inactive_opacity = 1,
        
        shadow = {
            enabled = true,
            range = 16,
            render_power = 5,
            color = "rgba(0,0,0,0.35)",
        },
        
        -- Transparent Window Blur
        --blur = {
            --enabled = true,
            --new_optimizations = true,
            --size = 2,
            --passes = 3,
            --vibrancy = 0.1696,
        --},
    },
    -- https://wiki.hyprland.org/Configuring/Dwindle-Layout/
    dwindle = {
        -- pseudotile = true deprecated Hyprland 0.55+
        preserve_split = true,
    },
    -- https://wiki.hyprland.org/Configuring/Master-Layout/
    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0, 1 }, { 0.18, 1.0 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 1.5,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2,
    bezier = "myBezier",
    style = "popin 95%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 12,
    bezier = "myBezier",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 5,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 6,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot --mode region --output-folder ~/Pictures"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output -m DP-3 --output-folder ~/Pictures"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot --mode window --output-folder ~/Pictures"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        fullscreen = 0,
        pin = 0,
    },
    no_focus = true,
})
