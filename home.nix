{ pkgs, ... }:

{
  imports = [ ./modules ];

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  home.sessionVariables = {

  };

  nixGL.packages = import <nixgl> { inherit pkgs; };
  nixGL.defaultWrapper = "nvidia";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-runtime-7.0.20"
    ];
  };
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
  home.username = "nobbele";
  home.homeDirectory = "/home/nobbele";
  home.stateVersion = "24.11";
}
