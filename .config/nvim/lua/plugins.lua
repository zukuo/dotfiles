return {

    -- Colorschemes
    { "loctvl842/monokai-pro.nvim", priority = 1000, opts = {transparent_background=false} },
    { "tjdevries/colorbuddy.nvim" },
    { "navarasu/onedark.nvim", opts = { style = "warmer" } },
    { "rose-pine/neovim", name = "rose-pine", priority = 1000, config = function() require("config.colors") end },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", opts = {} },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    -- { "lukas-reineke/indent-blankline.nvim", version = "2.20.8", opts = { show_trailing_blankline_indent = false } },
    { "RRethy/vim-illuminate" },
    { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("config.lualine") end },
    -- { "akinsho/bufferline.nvim", event = "VeryLazy", config = function() require("config.bufferline") end },
    -- { "echasnovski/mini.tabline", opts = { show_icons = false } },
    -- { "HiPhish/rainbow-delimiters.nvim", main = "rainbow-delimiters.setup", opts = {} },

    -- Utils
    { "lewis6991/gitsigns.nvim", opts = { numhl = true, yadm = { enable = true } } },
    { "nmac427/guess-indent.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    { "lervag/vimtex", init = function() end },
    -- { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
    -- TODO: Leetcode Plugin, Folding

    -- Copilot
    { "github/copilot.vim", config = function ()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_enabled = false
        vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end },
    -- { "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter", opts = { suggestions = { atuo_trigger = true } } },
    -- { "Exafunction/codeium.vim", config = function ()
    --     vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    --     vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --     vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    --     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    -- end },

    -- Editing
    { "numToStr/Comment.nvim", opts = { ignore = '^$' } },
    { "ethanholz/nvim-lastplace", opts = {} },
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
    { 'altermo/ultimate-autopair.nvim', event = {'InsertEnter', 'CmdlineEnter'}, branch = 'v0.6', opts = {} },

    -- File Management
    { "stevearc/oil.nvim", opts = {} },
    { "ThePrimeagen/harpoon", opts = {} },
    -- { "dzfrias/arena.nvim", event = "BufWinEnter", opts = {} },

    -- Movement
    { "declancm/cinnamon.nvim", opts = { default_delay = 5 } },
    { "matze/vim-move" },

    -- Startup Page
    { "goolord/alpha-nvim", event = "VimEnter", config = function() require("config.alpha") end },

    -- Treesitter (Syntax Highlighting)
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            },
        },
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        event = { "BufReadPost", "BufNewFile" },
        config = function() require("config.treesitter") end
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        opts = {}
    },

    -- LSP, Completion, & Snippets
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                cmd = 'LspInfo',
                event = {'BufReadPre', 'BufNewFile'},
                dependencies = {
                    -- CMP & Mason Installer
                    {'hrsh7th/cmp-nvim-lsp'},
                    {'williamboman/mason.nvim'},
                    {'williamboman/mason-lspconfig.nvim'},
                    -- Language Specifics
                    { "mfussenegger/nvim-jdtls", config = function() require("config.java") end },
                    { "folke/trouble.nvim" },
                }
            },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                dependencies = {
                    -- Extra Completions
                    {'hrsh7th/cmp-buffer'},
                    {'hrsh7th/cmp-path'},
                    -- Snippets
                    {'L3MON4D3/LuaSnip'},
                    {'saadparwaiz1/cmp_luasnip'},
                    {'rafamadriz/friendly-snippets'},
                }
            },
        },
        config = function() require("config.lsp") end
    },

}
