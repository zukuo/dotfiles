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
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.mousemoveevent = true
vim.opt.pumheight = 12 -- limit completion items (lsp)
vim.opt.laststatus = 3 -- only one statusbar per window

-- Set default status with git branch
function _G.gitsigns_branch()
  local branch = vim.b.gitsigns_head
  if branch and branch ~= "" then
    return "(Git:" .. branch .. ")"
  end
  return ""
end
vim.opt.statusline = '%<%f %h%m%r %{v:lua.gitsigns_branch()}%= %-14.(%l,%c%V%) %P'

-- Misc
vim.opt.spelllang = "en_gb"
vim.opt.spell = false
vim.opt.title = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Neovide
if vim.g.neovide then
    require("core.neovide")
end
