return {
    name = "telescope-frecency.nvim",
    dir = "@telescope_frecency_nvim@",
    keys = {
        {
            "<leader>fc",
            "<cmd>Telescope frecency path_display={'shorten'} theme=ivy<cr>", -- `function() require("telescope").extensions.frecency.frecency({ theme = "ivy" }) end` does not work...
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
