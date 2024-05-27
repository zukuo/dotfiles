-- Zukuo's Wezterm Config
local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    -- Font Settings
    font = wezterm.font_with_fallback({
        {family="JetBrains Mono", weight="Regular"},
        {family="Cascadia Code", weight="Regular", harfbuzz_features={"calt=1", "ss01=1", "ss19=1"}},
        {family="Fira Code", weight="Regular"},
        {family="IBM Plex Mono", weight="Medium"},
        {family="JoyPixels"},
    }),
    font_size = 18, -- old 14
    line_height = 1.3, -- old 1.6
    cursor_thickness = "175%", -- old 100%

    -- Rendering
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",
    max_fps = 240,
    animation_fps = 240,
    -- freetype_load_flags = "NO_HINTING", -- fix mac half loaded font (mainly cascadia code)
    -- freetype_load_target = "Light",
    -- freetype_render_target = "HorizontalLcd",

    -- Color Setings
    color_scheme_dirs = {"colors"},
    color_scheme = "base16mod",
    window_background_opacity = 0.9,
    macos_window_background_blur = 30,
    -- text_background_opacity = 0.5, -- causes powerline icons to appear funny

    -- GUI Settings
    cursor_blink_rate = 0,
    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    tab_max_width = 100,
    enable_scroll_bar = false,
    adjust_window_size_when_changing_font_size = false,
    -- hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}

-- Setup Keybinds
require("lua.keybinds").setup(config)

-- Setup WezSSH
require("lua.ssh").setup(config)

-- Setup Custom Tabs & Statusline
require("lua.tabs").setup(config)
require("lua.status")

-- Setup Overrides
require("lua.overrides").setup(config)

return config
