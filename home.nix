{ pkgs, ... }:

{
  imports = [
    ./modules/shell.nix
  ];

  shell = {
    enableZsh = true;
    prompt = "starship";
  };

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  home.file = {

  };

  home.sessionVariables = {

  };

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
  home.username = "nobbele";
  home.homeDirectory = "/home/nobbele";
  home.stateVersion = "24.11";
}
