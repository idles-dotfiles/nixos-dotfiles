{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.rust;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cargo
      rustc
      rustfmt
      clippy
    ];

    environment.variables = {
      RUST_BACKTRACE = "1";
    };
  };
}
