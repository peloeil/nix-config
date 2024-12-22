{ inputs, pkgs, ... }:
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
  lazy_nvim = pkgs.callPackage ../nix/lazy_nvim.nix { inherit inputs; };
  nvim_treesitter = pkgs.vimPlugins.nvim-treesitter;
  telescope_fzf_native_nvim = pkgs.callPackage ../nix/telescope_fzf_native.nix { inherit inputs; };
  telescope_aerial_nvim = pkgs.callPackage ../nix/telescope_aerial.nix { inherit inputs; };
}
