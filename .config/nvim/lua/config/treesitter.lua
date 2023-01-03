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
