return {
    name = "nvim-treesitter",
    dir = "@nvim_treesitter@",
    event = {
        "BufNewFile  *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.gitignore,*.go,*.html,*.js,*.json,*.tex,*.lua,*Makefile,*makefile,*.md,*.nix,*.py,*.rs,*.toml,*.tml,*.ts,*.typ,*.vim,*.txt,*.yaml,*.yml",
        "BufReadPost *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.gitignore,*.go,*.html,*.js,*.json,*.tex,*.lua,*Makefile,*makefile,*.md,*.nix,*.py,*.rs,*.toml,*.tml,*.ts,*.typ,*.vim,*.txt,*.yaml,*.yml",
    },
    opts = function(_, _)
        vim.opt.runtimepath:append("@treesitter_parser@")
        return {
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
