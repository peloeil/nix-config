{
  programs.git = {
    enable = true;
    userName = "Shun Ota";
    userEmail = "peloeil20@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
    };
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1u2Wk//mPtATDQ3OGAVAG7WZwA4KIYfff2AbSdlpzq peloeil@nixootas";
    };
    ignores = [ "*.swp" ];
  };
}
