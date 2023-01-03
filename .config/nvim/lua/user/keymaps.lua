vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
vim.keymap.set("n", "<leader><space>", vim.cmd.nohlsearch)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", vim.cmd.w)

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
