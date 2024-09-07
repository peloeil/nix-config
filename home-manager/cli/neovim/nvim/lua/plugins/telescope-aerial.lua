return {
    name = "telescope-aerial.nvim",
    dir = "@telescope_aerial_nvim@",
    keys = {
        {
            "<leader>fa",
            function()
                require("telescope").extensions.aerial.aerial()
            end,
            silent = true,
            desc = "pick lsp symbols",
        },
    },
    dependencies = {
        { name = "nvim-treesitter", dir = "@nvim_treesitter@" },
        { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
    },
    opts = {},
    config = function(_, opts)
        require("aerial").setup(opts)
        require("telescope").load_extension("aerial")
    end,
}
