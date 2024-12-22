{
  stdenv,
  vimUtils,
  inputs,
}:
let
  wrap = stdenv.mkDerivation {
    name = "wrap-copilot-chat";
    src = inputs.copilot_chat;
    builtPhase = ''
      make tiktoken
    '';
  };
in
vimUtils.buildVimPlugin {
  name = "CopilotChat.nvim";
  src = wrap;
}
