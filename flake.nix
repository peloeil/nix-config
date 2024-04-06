{
  description = "peloeil's configuration of NixOS and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      nixootas = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixootas/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      peloeil = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/peloeil/home.nix
        ];
      };
    };
  };
}
