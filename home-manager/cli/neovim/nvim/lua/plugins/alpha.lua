return {
    name = "alpha-nvim",
    dir = "@alpha_nvim@",
    event = function(_, _)
        if vim.fn.argc() == 0 then
            return { "VimEnter" }
        end
        return {}
    end,
    opts = function(_, _)
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", "<cmd>ene<cr>"),
            dashboard.button("q", "󰅚  Quit NVIM", "<cmd>qa<cr>"),
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f h", "󰈞  Search help"),
            dashboard.button("SPC f r", "  Frecency"),
            dashboard.button("SPC f g", "󰈬  Find word"),
        }
        return dashboard.config
    end,
}
