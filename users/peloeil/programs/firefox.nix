{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
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
