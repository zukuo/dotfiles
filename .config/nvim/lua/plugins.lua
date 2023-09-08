return {

    -- Colorschemes
    { "loctvl842/monokai-pro.nvim" },
    { "sainnhe/gruvbox-material" },
    { 'rose-pine/neovim', name = 'rose-pine', opts = { variant = 'moon' } },

    -- Set Colorscheme
    { "LazyVim/LazyVim", opts = { colorscheme = "rose-pine" } },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", opts = {} },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    { "lukas-reineke/indent-blankline.nvim", opts = { show_trailing_blankline_indent = false } },
    { "RRethy/vim-illuminate" },
    { "rcarriga/nvim-notify" },
    { 'stevearc/dressing.nvim', opts = {} },

    -- Fancy Overlays
    { "akinsho/bufferline.nvim", event = "VeryLazy", config = function() require("config.bufferline") end },
    { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("config.lualine") end },
    { "nvim-tree/nvim-tree.lua", event = "VeryLazy", config = function() require("config.nvim-tree") end },
    { "utilyre/barbecue.nvim", event = "VeryLazy", dependencies = { "SmiteshP/nvim-navic" }, opts = {} },

    -- Utils
    { "nmac427/guess-indent.nvim", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = { numhl = true, yadm = { enable = true } } },
    { "folke/neodev.nvim", opts = {} },

    -- Startup Page
    { "goolord/alpha-nvim", event = "VimEnter", config = function() require("config.alpha") end },

    -- Movement
    { "psliwka/vim-smoothie" },
    { "fedepujol/move.nvim" },

    -- Editing
    { "numToStr/Comment.nvim", opts = {} },
    { "ethanholz/nvim-lastplace", otps = {} },
    { "VonHeikemen/searchbox.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
    { 'altermo/ultimate-autopair.nvim', event = {'InsertEnter', 'CmdlineEnter'}, branch = 'v0.6', opts = {} },

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
        opts = {}
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
    { "folke/trouble.nvim", opts = {} },

}
