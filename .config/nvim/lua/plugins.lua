return {
    -- Eye Candy
    { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
    { "kyazdani42/nvim-web-devicons", config = true },
    { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },
    { "akinsho/bufferline.nvim", config = true },
    { "norcalli/nvim-colorizer.lua", config = true },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = "TSUpdate",
        event = "BufReadPost",
        config = function() require("config.treesitter") end
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
    { "lewis6991/gitsigns.nvim", config = true },
}
