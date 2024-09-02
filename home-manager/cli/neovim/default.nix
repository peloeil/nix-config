{ pkgs, inputs, ... }:
{
  home.packages = [ inputs.peloeil_nvim.packages.${pkgs.system}.default ];
}
