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
end

lualine.setup(config)
