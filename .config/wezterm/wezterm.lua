-- Zukuo's Wezterm Config
local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    -- Font Settings
    font = wezterm.font_with_fallback({
        {family="Berkeley Mono", weight="Regular"},
        {family="JetBrains Mono", weight="Regular"},
        {family="Cascadia Code", weight="Regular", harfbuzz_features={"calt=1", "ss01=1", "ss19=1"}},
        {family="Fira Code", weight="Regular"},
        {family="IBM Plex Mono", weight="Medium"},
        {family="JoyPixels"},
    }),
    font_size = 16,
    line_height = 1.2,
    -- cursor_thickness = "175%",

    -- Rendering
    -- front_end = "WebGpu",
    -- webgpu_power_preference = "HighPerformance",
    max_fps = 240,
    animation_fps = 240,

    -- TODO: make a global colorscheme property for terminal/prompt

    -- Color Setings
    color_scheme = 'Default Dark (base16)',
    colors = { background = "#141415" },

    -- GUI Settings
    cursor_blink_rate = 0,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW",
    window_padding = {
        left = 20,
        right = 20,
        top = 10,
        bottom = 10,
    },
}

-- Setup Keybinds
require("lua.keybinds").setup(config)

-- Setup Overrides
require("lua.overrides").setup(config)

return config
