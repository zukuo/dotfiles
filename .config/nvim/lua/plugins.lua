return {

    -- Colorschemes
    { "loctvl842/monokai-pro.nvim", priority = 1000 },
    { "sainnhe/gruvbox-material" },
    { "navarasu/onedark.nvim", opts = { style = "warmer" } },
    { "rose-pine/neovim", name = "rose-pine", priority = 1000, config = function() require("config.colors") end },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", opts = {} },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    { "lukas-reineke/indent-blankline.nvim", version = "2.20.8", opts = { show_trailing_blankline_indent = false } },
    { "RRethy/vim-illuminate" },
    { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("config.lualine") end },
    -- { "akinsho/bufferline.nvim", event = "VeryLazy", config = function() require("config.bufferline") end },
    -- { "echasnovski/mini.tabline", opts = { show_icons = false } },
    { "HiPhish/rainbow-delimiters.nvim", main = "rainbow-delimiters.setup", opts = {} },

    -- Utils
    { "lewis6991/gitsigns.nvim", opts = { numhl = true, yadm = { enable = true } } },
    { "nmac427/guess-indent.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },

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
                    {'hrsh7th/cmp-nvim-lsp'},
                    {'williamboman/mason.nvim'},
                    {'williamboman/mason-lspconfig.nvim'},
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
