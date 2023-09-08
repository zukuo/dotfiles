local nvim_tree = require('nvim-tree')
nvim_tree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
