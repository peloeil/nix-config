{
  description = "peloeil's configuration of Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    lazy_nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };
    alpha_nvim = {
      url = "github:goolord/alpha-nvim";
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
    };
}
