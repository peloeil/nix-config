{ lib, pkgs, ... }:

{
  programs.git = {
    enable = lib.mkDefault true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
