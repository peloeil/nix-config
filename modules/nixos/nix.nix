{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    optimise = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
