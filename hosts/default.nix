inputs@{
  nixpkgs,
  home-manager,
  nixos-hardware,
  ...
}:
let
  mkNixosSystem =
    {
      system,
      hostname,
      modules,
    }:
    nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname;
      };
    };
  mkHomeManagerConfiguration =
    {
      system,
      username,
      overlays,
      modules,
    }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system overlays; };
      extraSpecialArgs = {
        inherit inputs username;
      };
      modules = modules ++ [
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "24.05";
          };
          programs.home-manager.enable = true;
        }
      ];
    };
in
{
  nixos = {
    nixootas = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "nixootas";
      modules = [ ./nixootas/system ];
    };
  };
  home-manager = {
    "peloeil@nixootas" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "peloeil";
      overlays = [ ];
      modules = [ ./nixootas/users/peloeil ];
    };
    "sota@raspberrypi" = mkHomeManagerConfiguration {
      system = "aarch64-linux";
      username = "sota";
      overlays = [ ];
      modules = [ ./raspberrypi/users/sota ];
    };
  };
}
