{
  config,
  lib,
  pkgs,
  ...
}:

let
  shellCfg = config.shell;
in
{
  imports = [
    ./zsh.nix
    ./prompts/starship.nix
  ];

  options.shell = {
    enableZsh = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    prompt = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum [ "starship" ]);
      default = null;
    };
  };

  config = {
    home.packages = with pkgs; [
      eza
      ripgrep
    ];

    programs.bat.enable = true;
    programs.ripgrep.enable = true;
    programs.eza = {
      enable = true;
      enableZshIntegration = shellCfg.enableZsh;
      colors = "auto";
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = shellCfg.enableZsh;
    };
  };
}
