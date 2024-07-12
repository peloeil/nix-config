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
    libinput = {
      enable = true;
      touchpad = {
        disableWhileTyping = true;
        naturalScrolling = true;
        tapping = false;
        additionalOptions = ''
          Option "ScrollPixelDistance" "50"
        '';
      };
    };
    deviceSection = ''
      Option "TearFree" "true"
    '';
  };
}
