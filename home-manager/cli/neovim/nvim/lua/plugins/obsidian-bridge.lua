return {
    cond = not vim.g.vscode,
    name = "obsidian-bridge.nvim",
    dir = "@obsidian_bridge_nvim@",
    event = {
        "BufNewFile *.md",
        "BufReadPost *.md",
    },
    dependencies = {
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
    },
    opts = {
        scroll_sync = true,
    },
}
