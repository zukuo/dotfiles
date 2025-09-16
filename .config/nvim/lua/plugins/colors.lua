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
				vim.o.winborder = "rounded"
				-- Override Visual highlight to not completely override syntax colors
				vim.api.nvim_create_autocmd("ColorScheme", {
					pattern = "vague",
					callback = function()
						vim.api.nvim_set_hl(0, "Visual", {
							bg = "#333738",
							blend = 20,
							reverse = false,
						})
					end,
				})
			end,
		},
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "folke/tokyonight.nvim", opts = { style = "night" } },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "loctvl842/monokai-pro.nvim" },
	{ "sainnhe/gruvbox-material" },
}
