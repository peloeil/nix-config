{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = with builtins;
      let extension = shortId: uuid: {
        name = uuid;
	value = {
	  install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
          installation_mode = "normal_installed";
	};
      };
      in listToAttrs [
        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
        (extension "enhancer-for-youtube" "enhancerforyoutube@maximerf.addons.mozilla.org")
      ];
    };
    profiles.peloeil = {
      search = {
        force = true;
	default = "DuckDuckGo";
	privateDefault = "DuckDuckGo";
      };
      #containers = {
      #  programs = {
      #    color = "blue";
      #    icon = "chill";
      #    id = 1;
      #  };
      #};
    };
  };
}
