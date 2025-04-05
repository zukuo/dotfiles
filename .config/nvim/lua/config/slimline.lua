require("slimline").setup({
    style = 'fg',
    bold = true,
    hl = {
        secondary = 'Comment',
    },
    configs = {
        path = {
            hl = {
                primary = 'Label',
            },
        },
        git = {
            hl = {
                primary = 'Function',
            },
        },
        diagnostics = {
            hl = {
                primary = 'Statement',
            },
        },
        filetype_lsp = {
            hl = {
                primary = 'String',
            },
        },
    },
})
