return {

    -- Colorschemes
    { "rebelot/kanagawa.nvim" },
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },
    { "sainnhe/gruvbox-material" },

    -- Set Colorscheme
    { "LazyVim/LazyVim", opts = { colorscheme = "monokai-pro" } },
    { "xiyaowong/transparent.nvim" },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", config = true },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    { "lukas-reineke/indent-blankline.nvim", opts = { show_trailing_blankline_indent = false } },
    { "RRethy/vim-illuminate" },
    { "rcarriga/nvim-notify" },
    { 'stevearc/dressing.nvim', opts = {} },

    -- Fancy Line Bars
    { "akinsho/bufferline.nvim", config = true },
    { "utilyre/barbecue.nvim", dependencies = { "SmiteshP/nvim-navic" }, config = true },
    { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },

    -- Utils
    { "lewis6991/gitsigns.nvim", opts = { yadm = { enable = true } } },
    { "folke/neodev.nvim" },
    { "nvim-neo-tree/neo-tree.nvim" },

    -- Startup Page
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function() require("config.alpha") end
    },

    -- Movement
    { "psliwka/vim-smoothie" },
    { "fedepujol/move.nvim" },

    -- Editing
    { "numToStr/Comment.nvim", config = true },
    { "ethanholz/nvim-lastplace", config = true },
    { "VonHeikemen/searchbox.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
    { "windwp/nvim-autopairs", config = function() require("config.autopairs") end }, -- ultimate autopair is an alt

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

    -- Telescope & File Browser
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        config = true
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function() require("telescope").load_extension "file_browser" end
    },

    -- LSP, Completion, & Snippets
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
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
