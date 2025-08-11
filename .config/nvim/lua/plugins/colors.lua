return {
	{
		"tjdevries/colorbuddy.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("vague")
		end,
	},
	{
		"vague2k/vague.nvim",
		opts = {
			on_highlights = function(hl, _)
				hl.StatusLine.bg = "NONE"
				hl.StatusLineNC.bg = "NONE"
			end,
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", tag = "v1.11.0" }, -- update when TS is fixed
	{ "folke/tokyonight.nvim", opts = { style = "night" } },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "loctvl842/monokai-pro.nvim" },
	{ "sainnhe/gruvbox-material" },
}
