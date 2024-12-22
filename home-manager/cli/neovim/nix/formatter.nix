{ pkgs, ... }:
with pkgs;
[
  clang-tools # C/C++ (clang-format)
  jq # json
  nixfmt-rfc-style # nix
  ruff # python
  rustfmt # rust
  shellcheck # shell
  shfmt # shell, bash
  stylua # lua
  typstyle # typst
  yamlfix # yaml
]
