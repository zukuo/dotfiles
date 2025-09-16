return {
	{ "stevearc/quicker.nvim", event = "FileType qf", opts = {} },
	{
		"brenoprata10/nvim-highlight-colors",
		-- TODO: change and see if virtual symbol is better/worse
		opts = { render = "virtual", virtual_symbol = "●", enable_tailwind = true },
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		ft = {
			"typescriptreact",
			"html",
		},
	},
}
