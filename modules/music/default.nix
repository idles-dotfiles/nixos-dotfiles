{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  options.workstation.music = {
    enable = lib.mkEnableOption "enable sonora";
  };

  config = lib.mkIf config.workstation.music.enable {
    environment.systemPackages = with pkgs; [
      inputs.sonora.packages.${system}.default
    ];
  };
}
