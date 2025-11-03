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
			bang_expansion = true, -- check this is fine
		}
	end,
	keys = {
		{ "<leader>cs", "<cmd>below Compile<cr>" },
		{ "<leader>cc", "<cmd>below Recompile<cr>" },
		{ "<leader>cn", "<cmd>NextError<cr>" },
		{ "<leader>cq", function() require("compile-mode").close_buffer() end }, -- TODO: make it delete the buffer
	},
}
