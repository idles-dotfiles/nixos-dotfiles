{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    # Modules
    ../../modules/core
    ../../modules/development
    ../../modules/networking
    ../../modules/virtualization

    ## Desktop Environment
    ../../desktops/hyprland
  ];

  boot = {
    supportedFilesystems = [ "zfs" ];
    loader = {
      initrd = {
        systemd.enable = true;

        luks.devices."cryptroot" = {
          device = "/dev/disk/by-partlabel/luks";
          allowDiscards = true;
        };

        initrd.availableKernelModules = [
          "tpm_tis"
          "tpm_crb"
        ];
      };
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [
      "tpm_tis"
      "tpm_crb"
    ];
  };

  security = {
    tpm2.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;

  networking.hostId = "8425e349";

  environment.systemPackages = with pkgs; [
    tpm2-tools
    brave
  ];

  system.stateVersion = "26.05";
}
