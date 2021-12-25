-- Zukuo's Wezterm Config
local wezterm = require 'wezterm';

return {

    -- Font Settings
    font = wezterm.font_with_fallback({
        {family="JetBrains Mono Nerd Font", weight="Regular"},
        {family="Liga SFMono Nerd Font", weight="Regular"},
        {family="Fira Code Nerd Font", weight="Regular"},
        {family="Cascadia Code", weight="Book"},
        {family="JoyPixels"},
    }),
    font_size = 12,
    line_height = 1.3,
    -- harfbuzz_features={"calt=1", "ss01=1", "ss19=1"}, -- enable cursive & slashed 0 (cascadia code)
    -- harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- disable ligatures

    -- Color Setings
    color_scheme_dirs = {"colors"},
    color_scheme = "base16",
    window_background_opacity = 0.9,

    -- GUI Settings
    cursor_blink_rate = 0,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    -- window_decorations = "RESIZE", -- remove titlebar
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- Keybindings
    keys = {
        {key="c", mods="ALT", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="PrimarySelection"}},
    }
}
