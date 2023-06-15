return {

    -- Colorschemes
    { "rebelot/kanagawa.nvim" },
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },

    -- Eye Candy
    { "kyazdani42/nvim-web-devicons", config = true },
    { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },
    { "akinsho/bufferline.nvim", config = true },
    { "norcalli/nvim-colorizer.lua", config = true },

    -- File Management
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = "TSUpdate",
        event = "BufReadPost",
        config = function() require("config.treesitter") end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        config = true
    },

    -- Startup Page
    { "goolord/alpha-nvim", config = function() require("config.alpha") end },

    -- Movement
    { "psliwka/vim-smoothie" },
    { "matze/vim-move" },

    -- Editing
    { "numToStr/Comment.nvim", config = true },
    { "ethanholz/nvim-lastplace", config = true },
    { "windwp/nvim-autopairs", config = function() require("config.autopairs") end },

    -- Git Utils
    { "lewis6991/gitsigns.nvim", opts = { yadm = { enable = true } } },

    -- Set Colorscheme
    { "LazyVim/LazyVim", opts = {
        colorscheme = "monokai-pro",
    } },

}
