return {
    name = "aerial.nvim",
    dir = "@aerial_nvim@",
    keys = {
        {
            "<leader>a",
            "<cmd>AerialToggle!<cr>",
            silent = true,
        },
    },
    dependencies = {
        { name = "nvim-treesitter", dir = "@nvim_treesitter@" },
        { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
    },
    opts = {
        on_attach = function(bufnr)
            local opt = { buffer = bufnr }
            vim.keymap.set("n", "{", require("aerial").prev, opt)
            vim.keymap.set("n", "}", require("aerial").next, opt)
        end,
    },
}
