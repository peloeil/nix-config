{ config, pkgs, ... }:

{
  imports = [
    ./programs
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
    ];
  };
  programs.home-manager.enable = true;
}
