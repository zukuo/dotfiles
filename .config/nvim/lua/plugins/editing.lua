return {
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
		},
	},
	{ "ethanholz/nvim-lastplace", opts = {} },
	{ "echasnovski/mini.surround", event = "VeryLazy", version = false, opts = {} },
	{ "altermo/ultimate-autopair.nvim", event = { "InsertEnter", "CmdlineEnter" }, branch = "v0.6", opts = {} },
}
