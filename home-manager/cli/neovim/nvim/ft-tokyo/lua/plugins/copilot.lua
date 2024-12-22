return {
    name = "copilot",
    dir = "@copilot_lua@",
    cmd = "Copilot",
    opts = {
        suggestion = { enable = false },
        panel = { enable = false },
        filetypes = {
            gitcommit = true,
        },
    },
}
