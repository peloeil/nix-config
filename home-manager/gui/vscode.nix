{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode-remote.remote-ssh
      ms-python.python
      ms-toolsai.jupyter
      ms-azuretools.vscode-docker
      asvetliakov.vscode-neovim
    ];
  };
}
