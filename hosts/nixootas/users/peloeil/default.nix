{ pkgs, lib, ... }:
{
  imports = [
    ../../../../home-manager/cli/fish.nix
    ../../../../home-manager/cli/git.nix
    ../../../../home-manager/cli/neovim
    ../../../../home-manager/cli/starship.nix
    ../../../../home-manager/gui/fcitx
    ../../../../home-manager/gui/vscode.nix
    ../../../../home-manager/gui/alacritty.nix
    ../../../../home-manager/gui/dconf.nix
    ../../../../home-manager/gui/pwvucontrol.nix
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
      "vscode-extension-github-copilot"
      "vscode-extension-github-copilot-chat"
    ];
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  home.packages = with pkgs; [
    fastfetch
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
