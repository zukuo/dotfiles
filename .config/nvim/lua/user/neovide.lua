vim.o.guifont = "JetbrainsMono Nerd Font:h14"

vim.opt.linespace = 10

vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.5

vim.g.neovide_input_macos_option_key_is_meta = "only_left"
vim.g.neovide_hide_mouse_when_typing = true

-- Allow clipboard copy paste in neovim (MacOS)
vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+P')
vim.keymap.set('c', '<D-v>', '<C-R>+')
vim.keymap.set('i', '<D-v>', '<ESC>"+pa')

-- Cmd and Opt Delete
vim.keymap.set('i', '<C-BS>', '<C-W>')
vim.keymap.set('i', '<A-BS>', '<C-W>')
vim.keymap.set('i', '<D-BS>', '<C-U>')

-- Change UI Scale
vim.keymap.set({ "n", "v" }, "<D-=>", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end)
vim.keymap.set({ "n", "v" }, "<D-->", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end)
vim.keymap.set({ "n", "v" }, "<D-0>", function() vim.g.neovide_scale_factor = 1 end)
