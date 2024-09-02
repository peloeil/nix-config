{
  description = "peloeil's configuration of Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # package manager
    lazy_nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    # LSP
    nvim_lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    # formatter
    conform_nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    # filer
    oil_nvim = {
      url = "github:stevearc/oil.nvim";
      flake = false;
    };

    # misc
    hop_nvim = {
      url = "github:smoka7/hop.nvim";
      flake = false;
    };
    hlchunk_nvim = {
      url = "github:shellRaining/hlchunk.nvim";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      allSystems = [
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-linux" # 64-bit x86_64 Linux
        "aarch64-darwin" # 64-bit ARM macOS
        "x86_64-darwin" # 64-bit x86_64 macOS
      ];
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          plugins = import ./config/plugins.nix { inherit inputs pkgs; };
          lsp = import ./config/lsp.nix { inherit pkgs; };
          fmter = import ./config/formatter.nix { inherit pkgs; };
          config = pkgs.callPackage ./config { inherit plugins; };
          nvim-with =
            tools:
            pkgs.writeShellScriptBin "nvim" ''
              PATH=$PATH:${pkgs.lib.makeBinPath tools}
              MY_CONFIG_PATH=${config} ${pkgs.neovim-unwrapped}/bin/nvim -u ${config}/init.lua "$@"
            '';
        in
        {
          default = nvim-with (lsp ++ fmter);
          inherit config;
        }
      );
    };
}