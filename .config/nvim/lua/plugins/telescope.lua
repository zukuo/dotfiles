return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "pschmitt/telescope-yadm.nvim", config = function() require("telescope").load_extension("yadm_files") end },
        },
        cmd = "Telescope",
        opts = {},
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
            { "<leader>ce", "<cmd>Telescope yadm_files<cr>" },
            { "<C-p>", "<cmd>Telescope git_files<cr>" },
            { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
            { "<leader>gw", "<cmd>Telescope grep_string<cr>" },
            { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
            { '<leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end }
        },
    },
}
