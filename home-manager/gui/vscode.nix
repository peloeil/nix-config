{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-python.python
      ms-toolsai.jupyter
      asvetliakov.vscode-neovim
    ];
  };
}
