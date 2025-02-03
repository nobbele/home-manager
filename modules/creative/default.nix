{ pkgs, ... }:

{
  imports = [
    ./music-production
  ];

  config = {
    home.glPackages = with pkgs; [
      blender
      gimp
      krita
      libresprite
      kdePackages.kdenlive
    ];
  };
}
