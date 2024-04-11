{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = {}

      config.font = wezterm.font("Hack Nerd Font")
      config.font_size = 16.0

      return config
    '';
  };
}
