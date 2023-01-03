return {
    -- Eye Candy
    { "folke/tokyonight.nvim", config = function() vim.cmd("colorscheme tokyonight") end },
    { "kyazdani42/nvim-web-devicons", config = function() require("nvim-web-devicons").setup() end },
    { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
    "psliwka/vim-smoothie",

    -- Functionality
    "matze/vim-move",
    "b3nj5m1n/kommentary",
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },
    { "ethanholz/nvim-lastplace", config = function() require("nvim-lastplace").setup() end },
}
