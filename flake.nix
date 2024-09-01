{
  description = "peloeil's configuration of Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    lazy_nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };
    hop_nvim = {
      url = "github:smoka7/hop.nvim";
      flake = false;
    };
    oil_nvim = {
      url = "github:stevearc/oil.nvim";
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
          plugins = import ./pkgs/plugins.nix { inherit inputs pkgs; };
          config = pkgs.callPackage ./config.nix { inherit plugins; };
          mynvim = pkgs.writeShellScriptBin "nvim" ''
            MY_CONFIG_PATH=${config} ${pkgs.neovim-unwrapped}/bin/nvim -u ${config}/init.lua "$@"
          '';
        in
        {
          default = mynvim;
          inherit config;
        }
      );
    };
}
