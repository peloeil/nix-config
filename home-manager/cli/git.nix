{lib, ...}: {
  programs.git = {
    enable = true;
    userName = lib.mkDefault "Shun Ota";
    userEmail = lib.mkDefault "peloeil20@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = ["*.swp"];
  };
}
