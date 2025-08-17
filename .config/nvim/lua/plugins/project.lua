return {
    {
        "coffebar/neovim-project",
        opts = {
            -- Add all project dirs here
            projects = { os.getenv("DEV_DIR") .. "/*" },
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
