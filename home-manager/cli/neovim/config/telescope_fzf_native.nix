{
  stdenv,
  vimUtils,
  inputs,
}:
let
  wrap = stdenv.mkDerivation {
    name = "wrap-telescope-fzf-native";
    src = inputs.telescope_fzf_native_nvim;
    buildPhase = ''
      make
    '';
    installPhase = ''
      mkdir -p $out
      cp -r ./ $out
    '';
  };
in
vimUtils.buildVimPlugin {
  name = "telescope-fzf-native.nvim";
  src = wrap;
}
