return {
	{
		"faergeek/Comment.nvim", -- TODO: update to a newer stable branch
		branch = "nvim-0.12-compatibility",
		config = function()
			local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
			require("Comment").setup({
				ignore = "^$", -- ignore blank lines
				pre_hook = prehook, -- for typescript react commenting
			})
		end,
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
				languages = {
					c = { __default = "// %s", __multiline = "/* %s */" }, -- fix c commenting
				},
			})
		end,
	},
}
