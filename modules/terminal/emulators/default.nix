{
  lib,
  ...
}:

{
  imports = [
    ./ghostty.nix
    ./wezterm.nix
  ];

  options.terminal.emulator = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "ghostty"
        "wezterm"
      ]
    );
    default = null;
  };
}
