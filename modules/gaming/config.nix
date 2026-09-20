{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.workstation.gaming;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        osu-lazer-bin
        steam
        prismlauncher
        nvtopPackages.amd
      ];

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };

      programs.gamemode.enable = true;

      # GPU Driver
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          mesa
          vulkan-loader
          vulkan-validation-layers
        ];
      };

      services.xserver.videoDrivers = [ "amdgpu" ];
    })

    (lib.mkIf cfg.macro.enable {
      boot.kernelModules = [ "uinput" ];

      services.udev.extraRules = ''
        KERNEL=="uinput", GROUP="input", MODE="0660"
      '';

      users.users.river.extraGroups = [ "input" ];
    })
  ];
}
