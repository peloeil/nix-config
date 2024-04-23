{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set SSH_AGENT_FILE "$HOME/.ssh/ssh_agent"
      test -f $SSH_AGENT_FILE; and source $SSH_AGENT_FILE > /dev/null 2>&1
      if not ssh-add -l > /dev/null 2>&1
        if not ps -ef | grep -v grep | grep ssh-agent
          ssh-agent -c > $SSH_AGENT_FILE 2>&1
        end
        source $SSH_AGENT_FILE > /dev/null 2>&1
        find $HOME/.ssh -name id_ed25519 | xargs ssh-add
      end
    '';
  };
}
