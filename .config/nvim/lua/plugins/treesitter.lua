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
				"cpp",
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
				"python",
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
		branch = "main",
		init = function()
			-- Disable built-in ftplugin mappings to avoid conflicts
			vim.g.no_plugin_maps = true
		end,
		config = function()
			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")
			local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = false,
				},
				move = {
					set_jumps = true,
				},
			})

			-- Select
			vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
			vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
			vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
			vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner part of a class region" })
			vim.keymap.set({ "x", "o" }, "as", function() select.select_textobject("@local.scope", "locals") end, { desc = "Select language scope" })

			-- Move
			vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_start("@function.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_previous_start("@function.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
			vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)

			-- Repeatable moves with ; and ,
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

			-- Make f, F, t, T repeatable with ; and , as well
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
		end,
	},
}
