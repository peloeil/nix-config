{ pkgs, ... }:
pkgs.lib.pipe
  (pkgs.vimPlugins.nvim-treesitter.withPlugins (
    parser: with parser; [
      bash
      c
      cpp
      dockerfile
      fish
      git_config
      git_rebase
      gitcommit
      gitignore
      go
      html
      javascript
      json
      json5
      jsonc
      latex
      lua
      make
      markdown
      markdown_inline
      nix
      python
      rust
      ssh_config
      toml
      tsx
      typescript
      typst
      vim
      vimdoc
      yaml
    ]
  )).dependencies
  [
    (builtins.map builtins.toString)
    (builtins.concatStringsSep ",")
  ]
