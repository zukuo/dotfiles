--- LSP Settings ---
local lsp = require('lsp-zero').preset({
    name = "recommended"
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}
    -- Keybind for autoformatting with <leader>SPACE
    vim.keymap.set({'n', 'x'}, '<leader>=', function() vim.lsp.buf.format({async = false, timeout_ms = 10000}) end, opts)
end)

lsp.set_sign_icons({
  error = '󰅙',
  warn = '',
  hint = '󰌵',
  info = '󰋼'
})

--- Mason LSP Config Settings ---
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'pyright', 'tsserver', 'eslint', 'gopls'},
  handlers = {
    lsp.default_setup,
    -- Lua Setup
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    jdtls = lsp.noop,
  }
})

lsp.setup()

--- Completion Settings ---
-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

-- Load Friendly Snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Setup cmp
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Tab or Enter key to confirm completion
        ['<Tab>'] = cmp.mapping.confirm({select = false}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Use escape to exit suggestion list
        -- ['<Escape>'] = cmp.mapping.abort(),

        -- Navigate between completion item
        ['<M-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<M-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),

    -- Enable for borders around lsp completion
    -- window = {
    --     completion = cmp.config.window.bordered(),
    -- },

    -- Contactenate kind icons with kind type
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format(' %s%s', cmp_kinds[vim_item.kind], vim_item.kind)
            return vim_item
        end
    },

    completion = {
        completeopt = 'menu,menuone,noinsert' -- auto selects first entry
    }
})
