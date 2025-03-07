return {
    cond = not vim.g.vscode,
    name = "which-key.nvim",
    dir = "@which_key_nvim@",
    keys = {
        { "<leader>" },
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            silent = true,
            desc = "Buffer local Keymaps (which-key)",
        },
    },
    dependencies = {
        name = "nvim-web-devicons",
        dir = "@nvim_web_devicons@",
    },
    opts = {},
}
