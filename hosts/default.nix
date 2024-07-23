inputs: let
  mkNixosSystem = {
    system,
    hostname,
    modules,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname;
      };
    };
  mkHomeManagerConfiguration = {
    system,
    username,
    overlays,
    modules,
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
      };
      extraSpecialArgs = {
        inherit inputs username;
      };
      modules =
        modules
        ++ [
          {
            home = {
              inherit username;
              homeDirectory = "/home/${username}";
              stateVersion = "23.11";
            };
            programs.home-manager.enable = true;
          }
        ];
    };
in {
  nixos = {
    nixootas = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "nixootas";
      modules = [./nixootas/nixos];
    };
  };
  home-manager = {
    "peloeil@nixootas" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "peloeil";
      overlays = [];
      modules = [./nixootas/users/peloeil];
    };
  };
}
