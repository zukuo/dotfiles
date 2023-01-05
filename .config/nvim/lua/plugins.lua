return {
    -- Eye Candy
    { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
    { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },
    { "akinsho/bufferline.nvim", config = true },
    { "kyazdani42/nvim-web-devicons", config = true },
    { "lewis6991/gitsigns.nvim", config = true },
    { "norcalli/nvim-colorizer.lua", config = true },
    { "goolord/alpha-nvim", config = function() require("config.alpha") end },
    { "psliwka/vim-smoothie" },

    -- Treesitter Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = "TSUpdate",
        event = "BufReadPost",
        config = function() require("config.treesitter") end
    },

    -- Functionality
    { "matze/vim-move" },
    { "b3nj5m1n/kommentary" },
    { "windwp/nvim-autopairs", config = function() require("config.autopairs") end },
    { "ethanholz/nvim-lastplace", config = true },
}
