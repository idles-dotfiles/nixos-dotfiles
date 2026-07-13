{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.typescript;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bun
      prettier
      eslint
      typescript-language-server

      # TS tooling (optional but common)
      typescript

      # API Client
      bruno
    ];

    environment.variables = {
      NODE_OPTIONS = "--max-old-space-size=4096";
    };
  };
}
