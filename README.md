neovim + lazy.nvim でプラグインを管理する flake

# ディレクトリ構成
プラグインの設定ファイルは省略
```
.
├── flake.lock
├── flake.nix
├── nvim
│   ├── init.lua
│   └── lua
│       └── plugins
├── pkgs
│   ├── config.nix
│   ├── lazy_nvim.nix
│   └── plugins.nix
└── README.md
```
## `pkgs`
パッケージ関連の操作を行うファイル
- `config.nix`
    設定ファイルを nix 内で使えるように置換などをする設定
- `lazy_nvim.nix`
    `lazy.nvim` はデフォルトで `~/.config/nvim` を見にいってしまうので、これを nix store の設定ディレクトリのパスに変更する設定
- `plugins.nix`
    flake input として指定したプラグインを vim のプラグインとして nix で扱うための設定

## `nvim`
通常の `$XDG_CONFIG_HOME/config/nvim` に対応する。
プラグインのインストールは flake input として行っているため、通常と設定ファイルの書き方が少し異なることに注意する。
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
