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
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = let
      conf = hostname: system:
        inputs.nixpkgs.lib.nixosSystem {
          system = system;
          modules = [./hosts/${hostname}/configuration.nix];
          specialArgs = {
            inherit inputs;
            hostname = hostname;
          };
        };
    in {
      nixootas = conf "nixootas" "x86_64-linux";
    };
    homeConfigurations = let
      conf = username:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
          modules = [./users/${username}/home.nix];
          extraSpecialArgs = {
            inherit inputs;
            username = username;
          };
        };
    in {
      peloeil = conf "peloeil";
    };
  };
}
