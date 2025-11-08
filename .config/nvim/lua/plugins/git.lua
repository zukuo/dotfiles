return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			{
				"purarue/gitsigns-yadm.nvim",
				opts = { shell_timeout_ms = 1000 },
			},
		},
		opts = {
			_on_attach_pre = function(bufnr, callback)
				local ignore_filetypes = { "gitcommit", "gitrebase" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				require("gitsigns-yadm").yadm_signs(callback)
			end,
			numhl = true,
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
        keys = {
            { "<leader>nn", "<cmd>Neogit<cr>" },
        },
	},
}
