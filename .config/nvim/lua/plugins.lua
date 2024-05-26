return {

    -- Colorschemes
    {
        "tjdevries/colorbuddy.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbuddy"
        end,
    },
    { "loctvl842/monokai-pro.nvim" },
    { "sainnhe/gruvbox-material" },
    { "rose-pine/neovim", name = "rose-pine", config = function() require("config.colors") end },
    { "folke/tokyonight.nvim", lazy = false, opts = {} },
    { "catppuccin/nvim", name = "catppuccin" },
    { "navarasu/onedark.nvim", opts = { style = "warmer" } },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", opts = {} },
    { "brenoprata10/nvim-highlight-colors", opts = { render = "virtual", virtual_symbol = "⬤", enable_tailwind = true } },
    { "RRethy/vim-illuminate" },

    { "tjdevries/express_line.nvim", event = "VeryLazy", config = function() require("config.statusline") end },
    -- { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("config.evil") end },
    { "j-hui/fidget.nvim", opts = {} },

    -- Utils
    { "lewis6991/gitsigns.nvim", opts = { numhl = true, yadm = { enable = true } } },
    { "nmac427/guess-indent.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} }, -- needed?

    -- TODO: Leetcode Plugin, Folding
    -- TODO: Create folder for lsp -> lsp.haskell, lsp.java & only load these files in their filetypes
    { 'mrcjkb/haskell-tools.nvim', version = '^3', lazy = false },

    -- Copilot
    -- { "github/copilot.vim", config = function ()
    --     vim.g.copilot_no_tab_map = true
    --     vim.g.copilot_enabled = false
    --     vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    -- end },

    -- Editing
    { "numToStr/Comment.nvim", opts = { ignore = '^$' } },
    { "ethanholz/nvim-lastplace", opts = {} },
    { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
    { 'altermo/ultimate-autopair.nvim', event = {'InsertEnter', 'CmdlineEnter'}, branch = 'v0.6', opts = {} },

    -- File Management
    { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
    { "ThePrimeagen/harpoon", opts = {} },

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
        event = { "BufReadPost", "BufNewFile", "BufWritePost", "VeryLazy" },
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
    -- switch to no lsp-zero or newest one (add haskell here)
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = false,
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
