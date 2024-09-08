return {
    name = "telescope-frecency.nvim",
    dir = "@telescope_frecency_nvim@",
    keys = {
        {
            "<leader>fc",
            function()
                require("telescope").extensions.frecency.frecency(
                    require("telescope.themes").get_dropdown({ prompt_title = "Frequently Used" })
                )
            end,
            silent = true,
            desc = "frecency search",
        },
    },
    event = function(_, _)
        local argc = vim.fn.argc()
        if argc == 0 then
            return { "VimEnter" }
        end
        return {}
    end,
    dependencies = {
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
    },
    config = function(_, _)
        require("telescope").load_extension("frecency")
        vim.api.nvim_create_autocmd("UIEnter", {
            group = vim.api.nvim_create_augroup("__start_frecency", {}),
            callback = function()
                require("telescope").extensions.frecency.frecency(
                    require("telescope.themes").get_dropdown({ prompt_title = "Frequently Used" })
                )
            end,
        })
    end,
}
