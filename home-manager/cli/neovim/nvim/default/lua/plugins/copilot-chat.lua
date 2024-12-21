return {
    name = "copilot_chat",
    dir = "@copilot_chat@",
    dependencies = {
        { name = "copilot", dir = "@copilot_lua@" },
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
    },
    keys = {
        {
            "<leader>cq",
            function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                end
            end,
            silent = true,
            desc = "CopilotChat - Quick chat",
        },
    },
    opts = {
        show_help = true,
    },
}
