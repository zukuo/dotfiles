return {
    {
        "coffebar/neovim-project",
        opts = {
            projects = { "~/Git/*" },
            picker = { type = "telescope" },
            last_session_on_startup = true,
            dashboard_mode = true,
        },
        init = function() vim.opt.sessionoptions:append("globals") end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "Shatur/neovim-session-manager" },
        },
        keys = { { "<leader>fp", "<cmd>NeovimProjectDiscover history<cr>", desc = "Project Explorer" } },
        lazy = false,
        priority = 100,
    },
}
