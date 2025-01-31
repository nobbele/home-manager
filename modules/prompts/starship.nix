{
  config,
  lib,
  ...
}:

let
  shellCfg = config.shell;
in
{
  # options.shell.starship = {

  # };

  config = lib.mkIf (shellCfg.prompt == "starship") {
    programs.starship = {
      enable = true;
      enableZshIntegration = shellCfg.enableZsh;

      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
