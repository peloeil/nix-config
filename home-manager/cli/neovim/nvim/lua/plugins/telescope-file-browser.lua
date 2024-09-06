return {
    name = "telescope-file-browser.nvim",
    dir = "@telescope_file_browser_nvim@",
    keys = {
        {
            "<leader>fb",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "%:p:h",
                    select_buffer = true,
                })
            end,
            silent = true,
            desc = "browse files",
        },
    },
    event = function(_, _)
        local argc = vim.fn.argc()
        local idx = 0
        while idx < argc do
            local arg = vim.fn.argv(idx)
            if vim.fn.isdirectory(arg) == 1 then
                return { "BufWinEnter" }
            end
            idx = idx + 1
        end
        return {}
    end,
    dependencies = {
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
    },
    config = function(_, _)
        require("telescope").load_extension("file_browser")
    end,
}
