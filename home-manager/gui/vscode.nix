{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-ssh
      ms-azuretools.vscode-docker
      github.copilot
      github.copilot-chat
      # asvetliakov.vscode-neovim
      vscodevim.vim
      ms-python.python
      ms-toolsai.jupyter
    ];
  };
}
