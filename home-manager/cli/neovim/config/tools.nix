{ pkgs, ... }:
with pkgs;
[
  fd
  ripgrep
  nodejs_22
  lynx
  luajitPackages.tiktoken_core
]
