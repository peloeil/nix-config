return {
    name = "obsidian.nvim",
    dir = "@obsidian_nvim@",
    event = {
        "BufNewFile *.md",
        "BufReadPost *.md",
    },
    dependencies = {
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
        { name = "nvim-cmp", dir = "@nvim_cmp@" },
        { name = "telescope.nvim", dir = "@telescope_nvim@" },
        { name = "nvim-treesitter", dir = "@nvim_treesitter@" },
    },
    opts = function(_, _)
        vim.opt.conceallevel = 1
        return {
            workspaces = {
                { name = "personal", path = "~/Obsidian Vault" },
            },
            daily_notes = {
                folder = "daily_notes",
            },
            mappings = {},
        }
    end,
}
