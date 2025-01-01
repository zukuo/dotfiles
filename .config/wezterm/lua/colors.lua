-- Custom tab colorschemes, used for powerline tabs and status
-- Author: Zukuo

local M = {}

M.colors = {
    -- Monokai Pro
    ['monokaipro'] = {
        status = {
            '#191719',
            '#211E22',
            '#2B272C',
            '#342F35',
        },
        tabs = {
            TAB_BAR_BG = '#201D21',
            ACTIVE_TAB_BG = '#FFDC66',
            ACTIVE_TAB_FG = '#2B2B2B',
            INACTIVE_TAB_BG = '#3D353F',
            INACTIVE_TAB_FG = '#A5A5A5',
            HOVER_TAB_BG = '#877436',
            HOVER_TAB_FG = '#2B2B2B',
        }
    },

    -- Tokyo Night
    ['tokyonight'] = {
        status = {
            '#1A1B26',
            '#16161E',
            '#2F3549',
            '#3B4261',
        },
        tabs = {
            TAB_BAR_BG = '#1A1B26',
            ACTIVE_TAB_BG = '#7AA2F7',
            ACTIVE_TAB_FG = '#1A1B26',
            INACTIVE_TAB_BG = '#1F2335',
            INACTIVE_TAB_FG = '#A9B1D6',
            HOVER_TAB_BG = '#565F89',
            HOVER_TAB_FG = '#1A1B26',
        }
    }
}

return M
