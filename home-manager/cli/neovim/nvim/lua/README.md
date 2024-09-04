## keymap のオプション
詳細は `:help vim.keymap.set()`, `:help nvim_set_keymap` にある。

基本的にいじるのは `noremap`, `remap`, `silent`, `desc` のみだが、このうち
`noremap`, `remap` はデフォルト値が `true`, `false` と設定されているので
設定するのは `silent`, `desc` の2つ。

## autocmd
自分が調べた限りでは、`nvim_create_autocmd` 自身には
もう一度設定が source されたときに autocmd をクリアする設定はなかった。

しかし、`nvim_create_augroup` にはデフォルトでその機能がついているので、
vim script のときと同じように autocmd は必ずグループに入れて用いる。
