return {
    name = "copilot_chat",
    dir = "@copilot_chat@",
    dependencies = {
        { name = "copilot", dir = "@copilot_lua@" },
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
    },
    cmd = {
        "CopilotChat",
        "CopilotChatOpen",
        "CopilotChatClose",
        "CopilotChatToggle",
        "CopilotChatStop",
        "CopilotChatReset",
        "CopilotChatSave",
        "CopilotChatLoad",
        "CopilotChatDebugInfo",
        "CopilotChatModels",
        "CopilotChatAgents",
        "CopilotChatExplain",
        "CopilotChatReview",
        "CopilotChatFix",
        "CopilotChatOptimize",
        "CopilotChatDocs",
        "CopilotChatTests",
        "CopilotChatCommit",
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
    opts = function()
        vim.opt.completeopt = "menu,preview,noinsert,popup"
        return {
            model = "claude-3.5-sonnet",
            selection = function(source)
                return require("CopilotChat.select").buffer(source)
            end,
            window = {
                layout = "float",
            },
            show_help = true,
        }
    end,
}
