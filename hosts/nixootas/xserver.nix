{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
    };
    windowManager = {
      i3.enable = true;
    };
  };
}
