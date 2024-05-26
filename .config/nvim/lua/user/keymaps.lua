vim.keymap.set("n", "<leader><space>", vim.cmd.nohlsearch)

-- Global Copy & Paste keybinds
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, '<leader>Y', "\"+Y")

-- Better Deleting
vim.keymap.set({"x"}, "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Better Copying
vim.keymap.set("n", "Y", "y$")
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

-- Lazy Package Manager
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
vim.keymap.set("n", "<leader>fd", telescope.diagnostics, {})
vim.keymap.set("n", "<C-p>", telescope.git_files, {})
vim.keymap.set("n", "<space>/", telescope.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>gw", telescope.grep_string)
vim.keymap.set('n', '<leader>ps', function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end)

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h>", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon_ui.nav_file(4) end)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Trouble
vim.keymap.set("n", "<leader>t", "<CMD>TroubleToggle<CR>", { desc = "Toggle trouble menu" })
