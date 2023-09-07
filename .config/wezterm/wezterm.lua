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

    -- Rendering
    front_end = "WebGpu",
    freetype_load_flags = "NO_HINTING", -- fix mac half loaded font (mainly cascadia code)
    max_fps = 200,
    -- freetype_load_target = "Light",
    -- freetype_render_target = "HorizontalLcd",

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

    }
}
