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
    },

    -- Base16 Default Dark
    ['base16'] = {
        status = {
            '#181818',
            '#202020',
            '#303030',
            '#484848',
        },
        tabs = {
            TAB_BAR_BG = '#181818',
            ACTIVE_TAB_BG = '#383838',
            ACTIVE_TAB_FG = '#A3BE8C',
            INACTIVE_TAB_BG = '#282828',
            INACTIVE_TAB_FG = '#B8B8B8',
            HOVER_TAB_BG = '#383838',
            HOVER_TAB_FG = '#D8D8D8',
        }
    },

    -- Monochromatic Black & White
    ['blackwhite'] = {
        status = {
            '#181818',
            '#282828',
            '#383838',
            '#585858',
        },
        tabs = {
            TAB_BAR_BG = '#181818',
            ACTIVE_TAB_BG = '#D8D8D8',
            ACTIVE_TAB_FG = '#181818',
            INACTIVE_TAB_BG = '#282828',
            INACTIVE_TAB_FG = '#B8B8B8',
            HOVER_TAB_BG = '#383838',
            HOVER_TAB_FG = '#D8D8D8',
        }
    },
}

return M
