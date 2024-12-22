{
  pkgs,
  stdenv,
  plugins,
  ...
}:
stdenv.mkDerivation (
  plugins
  // {
    treesitter_parser = import ./parser.nix { inherit pkgs; };
  }
  // {
    pname = "peloeil-nvim-config";
    version = "0.0.1";
    src = ../nvim/ft-tokyo;
    installPhase = ''
      mkdir -p $out
      for file in $(find . -type f); do
        substituteAllInPlace "$file"
      done
      cp -r ./ $out
    '';
  }
)

