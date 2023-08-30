return {

    -- Colorschemes
    { "rebelot/kanagawa.nvim" },
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },

    -- Set Colorscheme
    { "LazyVim/LazyVim", opts = { colorscheme = "monokai-pro" } },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", config = true },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { tailwind = true } } },
    { "lukas-reineke/indent-blankline.nvim", opts = { show_trailing_blankline_indent = false } },
    { "RRethy/vim-illuminate" },

    -- Fancy Line Bars
    { "akinsho/bufferline.nvim", config = true },
    { "utilyre/barbecue.nvim", dependencies = { "SmiteshP/nvim-navic" }, config = true },
    { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },

    -- Utils
    { "lewis6991/gitsigns.nvim", opts = { yadm = { enable = true } } },
    { "folke/neodev.nvim" },

    -- Startup Page
    { "goolord/alpha-nvim", config = function() require("config.alpha") end },

    -- Movement
    { "psliwka/vim-smoothie" },
    { "matze/vim-move" },

    -- Editing
    { "numToStr/Comment.nvim", config = true },
    { "ethanholz/nvim-lastplace", config = true },
    { "windwp/nvim-autopairs", config = function() require("config.autopairs") end },
    { "VonHeikemen/searchbox.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    { "kylechui/nvim-surround", event = "VeryLazy", config = function() require("nvim-surround").setup({}) end },

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

    -- LSP & Completion
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'onsails/lspkind.nvim'}, -- Icons

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
        config = function() require("config.lsp") end
    },

}
