return {
    cond = false,
    name = "alpha-nvim",
    dir = "@alpha_nvim@",
    dependencies = {
        { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
    },
    event = function(_, _)
        if vim.fn.argc() == 0 then
            return { "VimEnter" }
        end
        return {}
    end,
    opts = function(_, _)
        return require("alpha.themes.startify").config
    end,
}
