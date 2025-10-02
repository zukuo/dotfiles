vim.keymap.set("n", "<leader><space>", vim.cmd.nohlsearch)

-- Global Copy & Paste keybinds
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, '<leader>Y', "\"+Y")

-- Better Deleting
vim.keymap.set({"x"}, "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Better Copying
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<C-,>", "<cmd>t.<cr>")
-- vim.keymap.set('v', 'y', 'myy`y')
-- vim.keymap.set('v', 'Y', 'myY`y')

-- Save using Ctrl+S
vim.keymap.set({"n", "i"}, "<C-s>", vim.cmd.w)

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<leader>e", "<cmd>vsplit +Oil<cr>")

-- Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Lazy Package Manaqer
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
