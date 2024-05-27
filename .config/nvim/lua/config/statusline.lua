local M = {}

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local subscribe = require "el.subscribe"
local sections = require "el.sections"

vim.opt.laststatus = 3

local function get_current_lsp()
  local msg = ''
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "[LSP]"
    end
  end
  return msg
end

M.setup = function()
  require("el").setup {
    generator = function()
      local segments = {}

      -- Vim Mode
      table.insert(segments, extensions.mode)

      -- Git Branch
      table.insert(segments, " ")
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
          local branch = extensions.git_branch(win, buf)
          if branch then
            return branch
          end
        end)
      )

      -- Git Changes
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
          local changes = extensions.git_changes(win, buf)
          if changes then
            return changes
          end
        end)
      )

      -- Filename 
      table.insert(segments, sections.split)
      table.insert(segments,
        subscribe.buf_autocmd(
          "el_file_icon",
          "BufRead",
          function(_, buffer)
            return extensions.file_icon(_, buffer)
          end
        ))
      table.insert(segments, "  ")
      table.insert(segments, "%f %m")

      -- Filetype + Position 
      table.insert(segments, sections.split)
      table.insert(segments, get_current_lsp)
      table.insert(segments, builtin.filetype)
      table.insert(segments, "[")
      table.insert(segments, builtin.line_with_width(3))
      table.insert(segments, ":")
      table.insert(segments, builtin.column_with_width(2))
      table.insert(segments, "]")

      return segments
    end,
  }
end

M.setup()

return M
