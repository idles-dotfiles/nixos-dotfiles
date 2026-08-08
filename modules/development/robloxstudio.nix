{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.engines.robloxstudio;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vinegar
    ];
  };
}
