return {
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = { show_hidden = true },
			win_options = { signcolumn = "yes:1" },
			float = { border = "rounded" },
		},
		dependencies = { "kyazdani42/nvim-web-devicons" },
		keys = {
			{ "-", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
		},
	},
	{ "refractalize/oil-git-status.nvim", config = true },
}
