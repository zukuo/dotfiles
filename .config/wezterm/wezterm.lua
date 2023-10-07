-- Zukuo's Wezterm Config
local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    -- Font Settings
    font = wezterm.font_with_fallback({
        {family="IBM Plex Mono", weight="Medium"},
        {family="Fira Code", weight="Medium"},
        {family="Cascadia Code", weight="Regular", harfbuzz_features={"calt=1", "ss01=1", "ss19=1"}},
        {family="JetBrains Mono", weight="DemiBold"},
        {family="JoyPixels"},
    }),
    font_size = 15,
    line_height = 1.5,

    -- Rendering
    front_end = "OpenGL",
    webgpu_power_preference = "HighPerformance",
    freetype_load_flags = "NO_HINTING", -- fix mac half loaded font (mainly cascadia code)
    max_fps = 240,
    animation_fps = 240,
    -- freetype_load_target = "Light",
    -- freetype_render_target = "HorizontalLcd",

    -- Color Setings
    color_scheme_dirs = {"colors"},
    color_scheme = "base16",
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

    -- Keybindings
    keys = {
        -- Linux Keybinds:
        -- Fix Copy & Paste
        {key="c", mods="ALT", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="PrimarySelection"}},
        -- Fix Ctrl+Backspace
        {key="\u{8}", mods="CTRL", action={SendKey={key="W", mods="CTRL"}}},

        -- MacOS Keybinds:
        -- Fix Option + Arrow Key Combinations
        {key="LeftArrow", mods="OPT", action={SendKey={key="b", mods="ALT"}}},
        {key="RightArrow", mods="OPT", action={SendKey={key="f", mods="ALT"}}},
        -- Fix Command + Arrow Key Combinations
        {key="LeftArrow", mods="CMD", action={SendKey={key="Home"}}},
        {key="RightArrow", mods="CMD", action={SendKey={key="End"}}},
        {key="UpArrow", mods="CMD", action={SendKey={key="PageUp"}}},
        {key="DownArrow", mods="CMD", action={SendKey={key="PageDown"}}},
        -- Fix Option/Command + Backspace
        {key="\u{8}", mods="OPT", action={SendKey={key="W", mods="CTRL"}}},
        {key="\u{8}", mods="CMD", action={SendKey={key="U", mods="CTRL"}}},

        -- TODO: Add better keybinds for splitting terminals
    }
}

-- Setup WezSSH
require("lua.ssh").setup(config)

-- Setup Custom Tabs & Statusline
require("lua.tabs").setup(config)
require("lua.status")

return config
