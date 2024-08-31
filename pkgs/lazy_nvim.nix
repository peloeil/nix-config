# lazy.nvim reads plugin configs from $HOME/.config/nvim via vim.fn.stdpath("config")
# This modified lazy.nvim refers to $MY_CONFIG_PATH instead of it
# I set Nix store path of my neovim config to $MY_CONFIG_PATH
{
  stdenv,
  vimUtils,
  inputs,
}:
let
  modifiedSrc = stdenv.mkDerivation {
    name = "modified-lazy.nvim";
    src = inputs.lazy_nvim;
    installPhase = ''
      mkdir -p $out
      for file in $(find . -type f); do
        substituteInPlace "$file" \
          --replace vim.fn.stdpath\(\"config\"\) vim.fn.expand\(\"\$MY_CONFIG_PATH\"\)
      done
      cp -r ./ $out
    '';
  };
in
vimUtils.buildVimPlugin {
  name = "lazy.nvim";
  src = modifiedSrc;
}
