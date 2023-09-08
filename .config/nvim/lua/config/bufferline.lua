local bufferline = require('bufferline')
bufferline.setup({
    options = {
        separator_style = 'slant',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = false -- use a "true" to enable the default, or set your own character
            }
        }
    }
})
