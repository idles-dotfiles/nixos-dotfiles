{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.claude;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      claude-code
    ];
  };
}
