{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.python;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3
      uv

      # dev tools
      ruff
      black
      mypy
    ];
  };
}
