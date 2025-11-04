return {
	{ "NMAC427/guess-indent.nvim", opts = {} },
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = false,
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
			},
			formatters = {
				clang_format = {
					args = { "--style={BasedOnStyle: webkit, IndentWidth: 4, PointerAlignment: Right}" }
				}
			}
		},
	},
}
