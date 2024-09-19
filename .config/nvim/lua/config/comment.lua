local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
require("Comment").setup({
    ignore = "^$", -- ignore blank lines
    pre_hook = prehook, -- for typescript react commenting
    post_hook = nil,
})
