{ pkgs, lib, ... }:
{
  imports = [
    ../../../../home-manager/cli/fish.nix
    ../../../../home-manager/cli/git.nix
    ../../../../home-manager/cli/neovim
    ../../../../home-manager/cli/starship.nix
    ../../../../home-manager/gui/fcitx
    ../../../../home-manager/gui/vscode.nix
    ../../../../home-manager/gui/wezterm
    ../../../../home-manager/gui/dconf.nix
    ./firefox.nix
    ./git.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "slack"
      "obsidian"
      "zoom"
      "vscode"
      "vscode-extension-ms-vscode-cpptools"
      "vscode-extension-ms-vscode-remote-remote-ssh"
    ];
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  home.packages = with pkgs; [
    neofetch
    git
    which
    btop
    slack
    discord
    obsidian
    zoom-us
    rye
    unzip
    chromium
  ];
}
