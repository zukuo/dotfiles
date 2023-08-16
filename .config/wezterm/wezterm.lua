-- Zukuo's Wezterm Config
local wezterm = require 'wezterm';

return {

    -- Font Settings
    font = wezterm.font_with_fallback({
        {family="Cascadia Code", weight="Regular", harfbuzz_features={"calt=1", "ss01=1", "ss19=1"}},
        {family="JetBrains Mono", weight="Medium"},
        {family="JoyPixels"},
    }),
    font_size = 15,
    line_height = 1.5,
    -- harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- disable ligatures
    -- cascadia code -> harfbuzz enables cursive & slashed 0 

    -- Color Setings
    color_scheme_dirs = {"colors"},
    color_scheme = "base16",
    window_background_opacity = 0.75,
    macos_window_background_blur = 30,
    -- text_background_opacity = 0.5, -- causes powerline icons to appear funny

    -- GUI Settings
    cursor_blink_rate = 0,
    enable_tab_bar = false,
    use_fancy_tab_bar = false,
    enable_scroll_bar = false,
    window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW", -- remove titlebar
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- Keybindings
    keys = {
        -- Fix Copy & Paste
        {key="c", mods="ALT", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},
        {key="v", mods="ALT", action=wezterm.action{PasteFrom="PrimarySelection"}},
        -- Fix Ctrl+Backspace
        {key="\u{8}", mods="CTRL", action={SendKey={key="W", mods="CTRL"}}},
        -- TODO: Add fix for alt+bkspc on macs
    }
}
