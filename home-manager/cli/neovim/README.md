neovim + lazy.nvim でプラグインを管理する flake

# ディレクトリ構成
プラグインの設定ファイルは省略
```
.
├── config
│   ├── default.nix
│   ├── formatter.nix
│   ├── lazy_nvim.nix
│   ├── lsp.nix
│   └── plugins.nix
├── default.nix
├── flake.lock
├── flake.nix
├── nvim
│   ├── init.lua
│   └── lua
│       ├── keymaps.lua
│       ├── options.lua
│       └── plugins
└── README.md
```
## `config`
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

# 使い方
## プラグインの追加
1. プラグインの URL を flake input に追加
2. プラグインの設定を `nvim/lua/plugins` に置く
