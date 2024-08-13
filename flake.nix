{
  description = "peloeil's configuration of NixOS and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
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
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    nixosConfigurations = (import ./hosts inputs).nixos;
    homeConfigurations = (import ./hosts inputs).home-manager;
  };
}
