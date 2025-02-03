{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (config.lib) nixGL;
in
{
  imports = [
    ./plasma.nix
    ./terminal
    ./creative
    ./games
    ./xdg.nix
  ];

  options.home.glPackages = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
    description = "The set of packages to appear in the user environment with nixGL wrapper.";
  };

  config = {
    home.glPackages = with pkgs; [
      qimgv
    ];

    home.packages = map config.lib.nixGL.wrap config.home.glPackages;

    programs.obs-studio = {
      enable = true;
      package = nixGL.wrap pkgs.obs-studio;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
  };
}
