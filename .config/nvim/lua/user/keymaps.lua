vim.keymap.set("n", "<leader><space>", vim.cmd.nohlsearch)

-- Global Copy & Paste keybinds
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, '<leader>Y', "\"+Y")
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")

-- Better Deleting
vim.keymap.set("v", "p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Better Copying
vim.keymap.set("n", "Y", "y$")
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- Save using Ctrl+S
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", vim.cmd.w)

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

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
vim.keymap.set("n", "<C-p>", telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end)

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- ToggleTerm
vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", {})
