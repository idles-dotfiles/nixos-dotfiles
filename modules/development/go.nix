{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.go;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      go

      # Language server
      gopls

      # Formatter with automatic import management
      gotools

      # Linting
      golangci-lint

      # Debugger
      delve

      # Useful extras
      air # Live reload for web apps
    ];
  };
}
