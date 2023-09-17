-- Set leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Set tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set GUI options
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mousemoveevent = true
vim.opt.pumheight = 12 -- limit completion items (lsp)
vim.opt.laststatus = 3 -- only one statusbar per window
vim.opt.statusline = "%=%t%="

-- Misc
vim.opt.spell = false
vim.opt.title = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
