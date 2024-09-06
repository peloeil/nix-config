return {
    name = "oil.nvim",
    dir = "@oil_nvim@",
    keys = {
        {
            "-",
            function()
                require("oil").open()
            end,
            silent = true,
        },
        {
            "<leader>-",
            function()
                require("oil").open_float()
            end,
            silent = true,
        },
    },
    event = function(_, _)
        local argc = vim.fn.argc()
        local idx = 0
        while idx < argc do
            local arg = vim.fn.argv(idx)
            if vim.fn.isdirectory(arg) == 1 then
                return { "VimEnter" }
            end
            idx = idx + 1
        end
        return {}
    end,
    dependencies = {
        name = "nvim-web-devicons",
        dir = "@nvim_web_devicons@",
    },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        git = {
            add = function(_, _)
                return true
            end,
            mv = function(_, _)
                return true
            end,
            rm = function(_)
                return true
            end,
        },
        float = {
            preview_split = "right",
        },
    },
}
