{
    services.xserver.libinput = {
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
}
