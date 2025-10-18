return {
	"ej-shafran/compile-mode.nvim",
	version = "^5.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			baleia_setup = true,
			-- to make `:Compile` replace special characters (e.g. `%`) in
			-- the command (and behave more like `:!`), add:
			-- bang_expansion = true,
		}
	end,
	keys = {
		{ "<leader>cc", "<cmd>below Compile<cr>" },
		{ "<leader>cr", "<cmd>below Recompile<cr>" },
		{ "<leader>cn", "<cmd>NextError<cr>" },
		{ "<leader>cq", function() require("compile-mode").close_buffer() end },
	},
}
