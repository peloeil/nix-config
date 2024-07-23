{
  description = "peloeil's configuration of NixOS and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware?rev=3980e7816c99d9e4da7a7b762e5b294055b73b2f";
  };

  outputs = inputs: let
    allSystems = [
      "aarch64-linux" # 64-bit ARM Linux
      "x86_64-linux" # 64-bit x86_64 Linux
      "aarch64-darwin" # 64-bit ARM macOS
      "x86_64-darwin" # 64-bit x86_64 macOS
    ];
    forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;
  in {
    packages = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);
    nixosConfigurations = (import ./hosts inputs).nixos;
    homeConfigurations = (import ./hosts inputs).home-manager;
  };
}
