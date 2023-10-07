require("rose-pine").setup({
	highlight_groups = {
		-- Telescope
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

		-- Indent Blankline
		IndentBlanklineChar = { fg = "overlay", bg = "none" },

		-- Rainbow Delimiters
		RainbowDelimiterRed = { fg = "love" },
		RainbowDelimiterYellow = { fg = "gold" },
		RainbowDelimiterBlue = { fg = "pine" },
		RainbowDelimiterOrange = { fg = "rose" },
		RainbowDelimiterGreen = { fg = "pine" },
		RainbowDelimiterViolet = { fg = "iris" },
		RainbowDelimiterCyan = { fg = "foam" },
	},
})

vim.cmd.colorscheme "rose-pine-moon"
