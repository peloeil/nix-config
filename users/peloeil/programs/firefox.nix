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
        (extension "multi-account-containers" "@testpilot-containers")
        (extension "ublock-origin" "uBlock0@raymondhill.net")
      ];
    };
    profiles.peloeil = {
      search = {
        force = true;
	default = "DuckDuckGo";
	privateDefault = "DuckDuckGo";
      };
      containers = {
        hobby = {
          color = "pink";
          icon = "fingerprint";
          id = 1;
        };
        programs = {
          color = "blue";
          icon = "chill";
          id = 2;
        };
	university = {
	  color = "orange";
	  icon = "briefcase";
	  id = 3;
	};
	laboratory = {
	  color = "purple";
	  icon = "tree";
	  id = 4;
	};
	ft-tokyo = {
	  color = "green";
	  icon = "vacation";
	  id = 42;
	};
      };
    };
  };
}
