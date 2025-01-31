{
  config,
  lib,
  ...
}:

let
  shellCfg = config.shell;
in
{
  config = lib.mkIf shellCfg.enableZsh {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        cat = "bat";
      };

      initExtra = ''
        unsetopt BEEP
      '';

      history.size = 10000;
    };
  };
}
