return {
    name = "telescope-frecency.nvim",
    dir = "@telescope_frecency_nvim@",
    keys = {
        {
            "<leader>fc",
            function()
                require("telescope").extensions.frecency.frecency(require("telescope.themes").get_dropdown())
            end,
            silent = true,
            desc = "frecency search",
        },
    },
    dependencies = {
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
    },
    config = function(_, _)
        require("telescope").load_extension("frecency")
    end,
}
