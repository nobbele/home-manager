{ pkgs, config, ... }:

let
  inherit (config.lib) nixGL;
in
{
  imports = [
    ./plasma.nix
    ./terminal
    ./creative
    ./games
  ];

  config = {
    terminal = {
      emulator = "ghostty";
      prompt = "starship";
    };

    creative = {
      daw = "lmms";
    };

    programs.obs-studio = {
      enable = true;
      package = nixGL.wrap pkgs.obs-studio;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
  };
}
