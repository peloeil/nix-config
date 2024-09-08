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
        local telescope = require("telescope")
        local fb_actions = telescope.extensions.file_browser.actions
        telescope.setup({
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    display_stat = { mode = true },
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            --["<A-c>"] = fb_actions.create,
                            --["<S-CR>"] = fb_actions.create_from_prompt,
                            --["<A-r>"] = fb_actions.rename,
                            --["<A-m>"] = fb_actions.move,
                            --["<A-y>"] = fb_actions.copy,
                            --["<A-d>"] = fb_actions.remove,
                            --["<C-g>"] = fb_actions.goto_parent_dir,
                            --["<C-f>"] = fb_actions.toggle_browser,
                            --["<C-t>"] = fb_actions.change_cwd,
                            ["<C-h>"] = fb_actions.goto_home_dir,
                            ["<C-.>"] = fb_actions.toggle_hidden,
                            ["<C-o>"] = false,
                            ["<C-e>"] = false,
                            ["<C-w>"] = false,
                            ["<C-s>"] = false,
                            ["<bs>"] = false,
                        },
                        ["n"] = {
                            --["c"] = fb_actions.create,
                            --["r"] = fb_actions.rename,
                            --["m"] = fb_actions.move,
                            --["y"] = fb_actions.copy,
                            --["d"] = fb_actions.remove,
                            --["g"] = fb_actions.goto_parent_dir,
                            --["f"] = fb_actions.toggle_browser,
                            --["t"] = fb_actions.change_cwd,
                            ["h"] = fb_actions.goto_home_dir,
                            ["o"] = false,
                            ["e"] = false,
                            ["w"] = false,
                            ["s"] = false,
                        },
                    },
                },
            },
        })
        telescope.load_extension("file_browser")
    end,
}
