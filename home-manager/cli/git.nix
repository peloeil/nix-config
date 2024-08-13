{ lib, ... }:
{
  programs.git = {
    enable = true;
    userName = lib.mkDefault "Shun Ota";
    userEmail = lib.mkDefault "peloeil20@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = [ "*.swp" ];
    aliases = {
      "logs" = ''
        !f(){ git log --graph --all --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""           %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"; };f
      '';
    };
  };
}
