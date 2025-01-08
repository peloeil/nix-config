{ pkgs, ... }:
with pkgs;
[
  bash-language-server # bash
  clang-tools # C/C++ (clangd)
  docker-compose-language-service # docker-compose
  dockerfile-language-server-nodejs # dockerfile
  lua-language-server # lua
  nil # nix
  pyright # python
  rust-analyzer # rust
  tinymist # typst
  typescript-language-server # typescript
  yaml-language-server # yaml
]
