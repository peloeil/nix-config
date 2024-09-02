{ stdenv, plugins, ... }:
stdenv.mkDerivation (
  plugins
  // {
    pname = "peloeil-nvim-config";
    version = "0.0.1";
    src = ../nvim;
    installPhase = ''
      mkdir -p $out
      for file in $(find . -type f); do
        substituteAllInPlace "$file"
      done
      cp -r ./ $out
    '';
  }
)
