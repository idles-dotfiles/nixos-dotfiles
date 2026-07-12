{
  config,
  lib,
  pkgs,
}:
let
  cfg = config.workstation.virtualization.lima;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lima
    ];
  };
}
