return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		event = { "BufReadPost", "BufNewFile", "BufWritePost", "VeryLazy" }, -- TODO: check if should have
		opts = {
			ensure_installed = { "html", "css", "javascript", "python", "c", "json", "vim", "lua" },
			auto_install = true,
            indent = { enable = true }, -- TODO: check if works with conform
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["[f"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["]f"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = false,
					},
				},
			})
		end,
	},
}
