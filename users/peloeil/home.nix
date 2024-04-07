{ lib, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "slack"
  ];

  home = rec {
    username = "peloeil";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; [
      neofetch
      neovim
      git
      which
      btop
      slack
    ];
  };
  programs.home-manager.enable = true;
}
