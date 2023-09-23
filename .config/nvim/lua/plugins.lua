return {

    -- Colorschemes
    { "loctvl842/monokai-pro.nvim" },
    { "sainnhe/gruvbox-material" },
    { "rose-pine/neovim", name = "rose-pine", config = function() require("config.colors") end },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },

    -- Set Colorscheme
    { "LazyVim/LazyVim", opts = { colorscheme = "rose-pine-moon" } },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", opts = {} },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    { "lukas-reineke/indent-blankline.nvim", opts = { show_trailing_blankline_indent = false } },
    { 'stevearc/dressing.nvim', opts = {} },
    { "RRethy/vim-illuminate" },
    -- { "HiPhish/rainbow-delimiters.nvim" },

    -- Fancy Overlays
    { "akinsho/bufferline.nvim", event = "VeryLazy", config = function() require("config.bufferline") end },
    { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("config.lualine") end },
    -- { "utilyre/barbecue.nvim", event = "VeryLazy", dependencies = { "SmiteshP/nvim-navic" }, opts = {} },

    -- Utils
    { "akinsho/toggleterm.nvim", opts = { direction = "float" } },
    { "nmac427/guess-indent.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    -- { "roobert/tailwindcss-colorizer-cmp.nvim", opts = { color_square_width = 2 }, },

    -- File Management
    { "stevearc/oil.nvim", opts = {} },
    { "ThePrimeagen/harpoon", opts = {} },

    -- Startup Page
    { "goolord/alpha-nvim", event = "VimEnter", config = function() require("config.alpha") end },

    -- Movement
    { "psliwka/vim-smoothie" },
    { "fedepujol/move.nvim" },

    -- Editing
    { "numToStr/Comment.nvim", opts = { ignore = '^$' } },
    { "ethanholz/nvim-lastplace", otps = {} },
    { "VonHeikemen/searchbox.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
    { 'altermo/ultimate-autopair.nvim', event = {'InsertEnter', 'CmdlineEnter'}, branch = 'v0.6', opts = {} },

    -- Git Utils
    { "lewis6991/gitsigns.nvim", opts = { numhl = true, yadm = { enable = true } } },
    { "sindrets/diffview.nvim", event = "VeryLazy", opts = {} },
    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
        },
        opts = {}
    },

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
        branch = 'v2.x',
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

    -- Diagnostics
    { "folke/trouble.nvim", opts = {} },

}
