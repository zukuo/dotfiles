-- Minimal lualine config
-- Author: Zukuo
local lualine = require("lualine")

-- Get name of current LSP
function get_lsp()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

-- Setup sections
local config = {
    options = {
        component_separators = '',
        section_separators = '',
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff' },
        lualine_c = {
            '%=', -- middle section
            { 'filetype', colored = false, icon_only = true },
            { 'filename', color = { gui = '' }, path = 1 }
    },
        lualine_x = { 'diagnostics', 'get_lsp()' },
        lualine_y = {},
        lualine_z = { { 'branch', icon=' ' } }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

-- If using rose-pine colorscheme, use alt theme
if (vim.g.colors_name == 'rose-pine') then
    config.options.theme = 'rose-pine-alt'

-- Monokai Pro Custom Setup - change colors and arrangement
elseif (vim.g.colors_name == 'monokai-pro') then
    local colors = require('monokai-pro.colorscheme').colors
    local monokai_pro_alt = require('lualine.themes.monokai-pro')

    colors.base.black = "#3A353A"

    monokai_pro_alt.normal = {
        a = { bg = colors.base.black , fg = colors.base.yellow, gui = "bold" },
        b = { bg = colors.base.black, fg = colors.base.dimmed2 },
        c = { bg = colors.base.black , fg = colors.base.dimmed2, gui = "italic" },
    }

    monokai_pro_alt.insert = {
        a = { bg = colors.base.black, fg = colors.base.green, gui = "bold" },
    }

    monokai_pro_alt.command = {
        a = { bg = colors.base.black, fg = colors.base.red, gui = "bold" },
    }

    monokai_pro_alt.visual = {
        a = { bg = colors.base.black, fg = colors.base.magenta, gui = "bold" },
    }

    monokai_pro_alt.replace = {
        a = { bg = colors.base.black, fg = colors.base.cyan, gui = "bold" },
    }

    monokai_pro_alt.inactive = {
        a = { bg = colors.base.black, fg = colors.base.dimmed3, gui = "bold" },
        b = { bg = colors.base.black, fg = colors.base.dimmed3 },
        c = { bg = colors.base.black, fg = colors.base.dimmed3, gui = "italic" },
    }

    config.options.theme = monokai_pro_alt

-- Anything else swap lsp info around
else
    config.sections.lualine_x = { 'diagnostics' }
    config.sections.lualine_y = { 'get_lsp()' }
end

lualine.setup(config)
