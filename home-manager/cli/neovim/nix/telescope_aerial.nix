{
  stdenv,
  vimUtils,
  inputs,
}:
let
  telescope-aerial = stdenv.mkDerivation {
    name = "aerial.nvim";
    src = inputs.aerial_nvim;
    buildPhase = ''

    '';
    installPhase = ''
      mkdir -p $out
      cp -r ./ $out
    '';
  };
in
vimUtils.buildVimPlugin {
  name = "telescope-aerial.nvim";
  src = telescope-aerial;
}
