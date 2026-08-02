{ config, pkgs, lib, ... }:

let
  cfg = config.workstation.bitwarden;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages =
      with pkgs;
      [
        bitwarden-desktop
        bitwarden-cli
      ]
      ++ lib.optionals cfg.menu.enable [
        bitwarden-menu
      ];
  };
}
