require("slimline").setup({
    style = 'fg',
    bold = true,
    hl = {
        base = 'NormalFloat', -- add different color to line
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
