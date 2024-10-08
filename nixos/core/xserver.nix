{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
    };
    windowManager = {
      i3 = {
        enable = true;
        configFile = ./i3config;
      };
    };
    desktopManager.runXdgAutostartIfNone = true;
    deviceSection = ''
      Option "TearFree" "true"
    '';
  };
}
