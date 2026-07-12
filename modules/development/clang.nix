{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.clang;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gcc
      cmake
      clang
    ];
  };
}
