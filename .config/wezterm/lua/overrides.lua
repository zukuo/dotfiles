-- Setup ssh hosts for wezterm integrated connection
-- Source: wez's docs (modified)
-- Author: Zukuo
local wezterm = require 'wezterm'
local utils   = require 'lua.utils'

local module = {}

function module.setup(config)

    -- Toggle Tab Bar Function
    wezterm.on("toggle-bar", function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if not overrides.enable_tab_bar then
            overrides.enable_tab_bar = true
        else
            overrides.enable_tab_bar = false
        end
        window:set_config_overrides(overrides)
    end)

    -- Adjust line_height based on current font
    local current_font = config.font.font[1].family
    if (current_font == "Cascadia Code") then
        config.font_size = config.font_size + 1
        config.line_height = config.line_height + 0.2
    end

    -- Adjust font_size based on OS
    if utils.is_linux() then
        config.font_size = config.font_size - 2
    end

end

return module
