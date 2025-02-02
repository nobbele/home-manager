{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cat = "bat";
      grep = "rg";
      hm = "home-manager";
      hms = "home-manager switch";
    };

    initExtra = ''
      unsetopt BEEP
    '';

    history.size = 10000;
  };
}
