{
  inputs,
  pkgs,
  ...
}:
let
  pluginInputs = builtins.removeAttrs inputs [ "nixpkgs" ];
in
(builtins.mapAttrs (
  name: value:
  pkgs.vimUtils.buildVimPlugin {
    name = name;
    src = value;
  }
) pluginInputs)
// {
  lazy_nvim = pkgs.callPackage ../config/lazy_nvim.nix { inherit inputs; };
}
