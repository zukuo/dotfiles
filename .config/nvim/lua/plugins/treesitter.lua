return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"html", "css", "javascript", "python", "c", "json", "lua"},
            auto_install = true, -- make sure `tree-sitter` is installed
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
