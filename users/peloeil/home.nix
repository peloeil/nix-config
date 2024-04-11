{ lib, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "slack"
    "obsidian"
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
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
      discord
      obsidian
    ];
  };
  programs.home-manager.enable = true;
}
