return {
	{ -- IMPORTANT: Make sure to install tree-sitter-cli and using nvim 0.12+
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile", "BufWritePost", "VeryLazy" },
		build = ":TSUpdate",
		branch = "main",
		config = function()
			local nvim_treesitter = require("nvim-treesitter")

			local ensure_installed = {
				"bash",
				"c",
				"diff",
				"css",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"zig",
				"go",
				"json",
				"yaml",
			}
			nvim_treesitter.install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf, filetype = args.buf, args.match

					-- Check language exists
					local language = vim.treesitter.language.get_lang(filetype)
					if not language then
						return
					end

					-- Auto install language
					if not vim.treesitter.language.add(language) then
						local available = vim.g.ts_available or nvim_treesitter.get_available()
						if not vim.g.ts_available then
							vim.g.ts_available = available
						end
						if vim.tbl_contains(available, language) then
							nvim_treesitter.install({ language }):await(function(err)
								if err then
									vim.notify("Treesitter install error for filetype: " .. filetype .. " err: " .. err)
									return
								end

								pcall(vim.treesitter.start, buf, language)
								vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
							end)
						end
					end

					-- Enable language -> TODO: check if redundant and can optimize?
					if vim.treesitter.language.add(language) then
						vim.treesitter.start(buf, language)
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
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
