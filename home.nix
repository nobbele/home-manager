{ pkgs, ... }:

{
  imports = [ ./modules ];

  terminal = {
    emulator = "kitty";
    prompt = "starship";
  };

  creative = {
    daw = "lmms";
  };

  defaultApplications = {
    video = "vlc.desktop";
    audio = "vlc.desktop";
    image = "qimgv.desktop";
    archive = "org.kde.ark.desktop";
    browser = "brave-browser.desktop";
    pdf = "brave-browser.desktop";
    file-explorer = "org.kde.dolphin.desktop";
    text = "kate.desktop";
  };

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  home.sessionVariables = {

  };

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
