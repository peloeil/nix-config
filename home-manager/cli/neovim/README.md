neovim + lazy.nvim でプラグインを管理する flake

# ディレクトリ構成
プラグインの設定ファイルは省略
```
.
├── default.nix
├── flake.lock
├── flake.nix
├── nix
│   ├── copilot_chat.nix
│   ├── default.nix
│   ├── formatter.nix
│   ├── lazy_nvim.nix
│   ├── lsp.nix
│   ├── parser.nix
│   ├── plugins.nix
│   ├── telescope_aerial.nix
│   ├── telescope_fzf_native.nix
│   └── tools.nix
├── nvim
│   ├── init.lua
│   └── lua
│       ├── keymaps.lua
│       ├── options.lua
│       └── plugins
└── README.md
```
## `nix/`
この flake の設定を行うファイル
- `default.nix`
    設定ファイル(`nvim` 以下)を nix 内で使えるように置換などをする設定
- `lazy_nvim.nix`
    `lazy.nvim` はデフォルトで `~/.config/nvim` を見にいってしまうので、これを nix store の設定ディレクトリのパスに変更する設定
- `plugins.nix`
    flake input として指定したプラグインを vim のプラグインとして nix で扱うための設定
- `lsp.nix`
    neovim 実行時にパスに入れる LSP
- `formatter.nix`
    neovim 実行時にパスに入れる formatter

## `nvim`
通常の `$XDG_CONFIG_HOME/config/nvim` に対応する。
プラグインのインストールは lazy.nvim が github から行うではなく flake input として行っているため、通常と設定ファイルの書き方が少し異なることに注意する。

e.g. `nvim/lua/plugins/oil.nvim`
```lua
return {
    name = "oil.nvim",
    dir = "@oil_nvim@",
    keys = {
        { "-", "<cmd>Oil<CR>"}
    },
    opts = {},
}
```
このように、`name`, `dir` を指定する必要があり、`dir` はこの flake の install 時に nix によって置換されるため、`@pluginInputName@` のように指定する(`pluginInputName` は flake input に指定したプラグインの名前に対応する)。

### 設定ファイルの書き方
(ただの好みとして)以下の順番に従う
```lua
return {
    name = "sample",
    dir = "@sample@",
    cond = false,
    priority = 1000,
    cmd = {
        "sample_cmd",
    },
    ft = {
        "sample_ft",
    },
    keys = {
        { "sample_key" }
    },
    event = {
        "sample_event"
    },
    dependencies = {
        name = "sample_deps",
        dir = "@sample_deps",
        ...
    },
    opts = {},
    config = true,
}
```
`config` は `require(main).setup(opts)` の呼ばれる位置が挙動に影響するか、そもそも呼びたくない場合のみ用いる。

e.g. `nvim/lua/plugins/colorscheme.lua`
```lua
return {
    {
        name = "gruvbox.nvim",
        dir = "@gruvbox_nvim@",
        priority = 1000,
        event = {
            "VimEnter",
        },
        opts = {
            terminal_colors = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                folds = false,
            },
            transparent_mode = true,
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.opt.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
```
[gruvbox の README](https://github.com/ellisonleao/gruvbox.nvim/blob/main/README.md#configuration)
> VERY IMPORTANT: Make sure to call setup() BEFORE calling the colorscheme command, to use your custom configs

にある通り、`colorscheme gruvbox` を実行する前に `require("gruvbox").setup` が実行されている必要がある
ので、`opts` を定義した後、`config` で引数として `opts` を受け取り、即座に `require("gruvbox").setup(opts)` を実行している。
`setup` の呼ばれる場所が挙動に影響しない場合は、[lazy.nvim のドキュメント](https://lazy.folke.io/spec#spec-setup)
> Always use opts instead of config when possible. config is almost never needed.

にある通り、`opts` のみを用いる。

# 使い方
## 起動
プロジェクトルートにおいては、`nix run .` == `nvim`
なので、単純に普段 `nvim` としているところを `nix run .` にすれば良い。
## プラグインの追加
1. プラグインの URL を flake input に追加
2. プラグインの設定を `nvim/lua/plugins` に置く
