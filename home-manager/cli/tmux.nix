{ lib, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    mouse = true;
    secureSocket = lib.mkDefault false;
  };
}
