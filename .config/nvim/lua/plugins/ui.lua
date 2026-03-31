return {
	{ "stevearc/quicker.nvim", event = "FileType qf", opts = {} },
	{
		"brenoprata10/nvim-highlight-colors",
		opts = { render = "virtual", virtual_symbol = "●", enable_tailwind = true },
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({
				whitelist = { "tsx", "html" },
			})
		end,
		ft = { "typescriptreact", "html" },
	},
}
