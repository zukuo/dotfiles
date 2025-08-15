local wezterm = require("wezterm")
local utils = require("lua.utils")

local module = {}

function module.setup(config)
    config.keys = {}

    if utils.is_mac() then
        --== MACOS KEYBINDS ==--

        config.keys = {
            -- Fix Option + Arrow Key Combinations
            { key = "LeftArrow",  mods = "OPT",       action = { SendKey = { key = "b", mods = "ALT" } } },
            { key = "RightArrow", mods = "OPT",       action = { SendKey = { key = "f", mods = "ALT" } } },

            -- Fix Command + Arrow Key Combinations
            { key = "LeftArrow",  mods = "CMD",       action = { SendKey = { key = "Home" } } },
            { key = "RightArrow", mods = "CMD",       action = { SendKey = { key = "End" } } },
            { key = "UpArrow",    mods = "CMD",       action = { SendKey = { key = "PageUp" } } },
            { key = "DownArrow",  mods = "CMD",       action = { SendKey = { key = "PageDown" } } },

            -- Fix Option/Command + Backspace
            { key = "\u{8}",      mods = "OPT",       action = { SendKey = { key = "W", mods = "CTRL" } } },
            { key = "\u{8}",      mods = "CMD",       action = { SendKey = { key = "U", mods = "CTRL" } } },

            -- Custom Events
            { key = "b",          mods = "CMD",       action = wezterm.action.EmitEvent "toggle-bar" },
            { key = "P",          mods = "CMD",       action = wezterm.action.ActivateCommandPalette },

            -- Window Splits
            { key = "-",          mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
            { key = "\\",         mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
            { key = "w",          mods = "CMD",       action = wezterm.action.CloseCurrentPane { confirm = true } },
            { key = ';',          mods = 'CMD',       action = wezterm.action.TogglePaneZoomState },

            -- Vim Movement for Panes
            { key = 'j',          mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Down') },
            { key = 'k',          mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Up') },
            { key = 'h',          mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Left') },
            { key = 'l',          mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Right') },

            -- Pane Adjustment
            { key = 'j',          mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
            { key = 'k',          mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
            { key = 'h',          mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
            { key = 'l',          mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
        }
    else
        --== LINUX KEYBINDS ==--

        local modkey = "ALT"
        config.keys = {
            -- Fix Copy & Paste
            { key = "c",          mods = modkey, action = wezterm.action { CopyTo = "ClipboardAndPrimarySelection" } },
            { key = "v",          mods = modkey, action = wezterm.action { PasteFrom = "Clipboard" } },
            { key = "v",          mods = modkey, action = wezterm.action { PasteFrom = "PrimarySelection" } },

            -- Fix Ctrl/Alt + Backspace
            { key = "\u{8}",      mods = "CTRL", action = { SendKey = { key = "W", mods = "CTRL" } } },
            { key = "\u{8}",      mods = "ALT",  action = { SendKey = { key = "U", mods = "CTRL" } } },

            -- Fix Alt + Arrow Key Combinations
            { key = "LeftArrow",  mods = "ALT",  action = { SendKey = { key = "Home" } } },
            { key = "RightArrow", mods = "ALT",  action = { SendKey = { key = "End" } } },
            { key = "UpArrow",    mods = "ALT",  action = { SendKey = { key = "PageUp" } } },
            { key = "DownArrow",  mods = "ALT",  action = { SendKey = { key = "PageDown" } } },

            -- Fix New/Close Tabs
            { key = "t",          mods = modkey, action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
            { key = "w",          mods = modkey, action = wezterm.action.CloseCurrentTab { confirm = true } },
        }

        -- Change workspaces with Ctrl+[num]
        for i = 1, 8 do
            table.insert(config.keys, {
                key = tostring(i),
                mods = modkey,
                action = wezterm.action.ActivateTab(i - 1),
            })
        end
    end

    -- Fix keys from tmux
    table.insert(config.keys, {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendString('\x1b[104;6u'),
    })
    table.insert(config.keys, {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendString('\x1b[108;6u'),
    })

end

return module
