return {
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
        config = function()
            local treesitter_config = require("nvim-treesitter.configs")
            if not treesitter_config then return end
            treesitter_config.setup({
                ensure_installed = {"html", "css", "javascript", "python", "c", "json", "vim", "lua"},
                auto_install = true, -- make sure `tree-sitter` is installed
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
}
