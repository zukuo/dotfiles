-- Disable new line comments
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Open telescope when there are no buffers
local function get_listed_buffers()
  local buffers = {}
  local len = 0
  for buffer = 1, vim.fn.bufnr('$') do
    if vim.fn.buflisted(buffer) == 1 then
      len = len + 1
      buffers[len] = buffer
    end
  end

  return buffers
end

vim.api.nvim_create_augroup('telescope_on_empty', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'BDeletePre',
  group = 'telescope_on_empty',
  callback = function(event)
    local found_non_empty_buffer = false
    local buffers = get_listed_buffers()

    for _, bufnr in ipairs(buffers) do
      if not found_non_empty_buffer then
        local name = vim.api.nvim_buf_get_name(bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

        -- Skip the buffer being deleted and empty/special buffers
        if bufnr ~= event.buf and name ~= '' and ft ~= 'TelescopePrompt' and ft ~= 'alpha' then
          found_non_empty_buffer = true
        end
      end
    end

    if not found_non_empty_buffer then
      -- Check if Alpha is currently open
      local current_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      if current_ft == 'alpha' or current_ft == 'oil' then
        return -- Don't open telescope if Alpha is already open
      end
      
      -- Close neo-tree if it's open
      local ok_neotree, neotree = pcall(require, 'neo-tree')
      if ok_neotree then
        neotree.close_all()
      end
      
      -- Small delay to ensure buffer deletion is complete
      vim.defer_fn(function()
        local ok_telescope, telescope = pcall(require, 'telescope.builtin')
        if ok_telescope then
          -- Check if we're in a meaningful directory (not home or root)
          local cwd = vim.fn.getcwd()
          local home = vim.fn.expand("~")
          
          -- If in home directory or root, try neovim-project, otherwise use find_files
          if cwd == home or cwd == "/" or cwd == "C:\\" then
            local ok_project, _ = pcall(require, "neovim-project")
            if ok_project then
              vim.cmd('NeovimProjectDiscover')
            else
              telescope.find_files()
            end
          else
            -- We're in a specific folder, use find_files
            telescope.find_files()
          end
        else
          vim.notify("Telescope not available", vim.log.levels.WARN)
        end
      end, 50) -- 50ms delay
    end
  end,
})

-- Optional: Also trigger when manually closing the last buffer with :bdelete, :bwipe, etc.
vim.api.nvim_create_autocmd('BufDelete', {
  group = 'telescope_on_empty',
  callback = function(event)
    -- Small delay to let the buffer deletion complete
    vim.defer_fn(function()
      local buffers = get_listed_buffers()
      local has_real_buffers = false
      
      for _, bufnr in ipairs(buffers) do
        local name = vim.api.nvim_buf_get_name(bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        
        -- Check if we have any real buffers left (not empty, not special filetypes)
        if name ~= '' and ft ~= 'TelescopePrompt' and ft ~= 'qf' and ft ~= 'help' and ft ~= 'alpha' then
          has_real_buffers = true
          break
        end
      end
      
      if not has_real_buffers then
        -- Check if Alpha is currently open
        local current_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      if current_ft == 'alpha' or current_ft == 'oil' then
          return -- Don't open telescope if Alpha is already open
        end
        
        -- Close neo-tree if it's open
        local ok_neotree, neotree = pcall(require, 'neo-tree')
        if ok_neotree then
          neotree.close_all()
        end
        
        -- Open telescope
        local ok_telescope, telescope = pcall(require, 'telescope.builtin')
        if ok_telescope then
          -- Check if we're in a meaningful directory (not home or root)
          local cwd = vim.fn.getcwd()
          local home = vim.fn.expand("~")
          
          -- If in home directory or root, try neovim-project, otherwise use find_files
          if cwd == home or cwd == "/" or cwd == "C:\\" then
            local ok_project, _ = pcall(require, "neovim-project")
            if ok_project then
              vim.cmd('NeovimProjectDiscover')
            else
              telescope.find_files()
            end
          else
            -- We're in a specific folder, use find_files
            telescope.find_files()
          end
        end
      end
    end, 100) -- 100ms delay for BufDelete
  end,
})
