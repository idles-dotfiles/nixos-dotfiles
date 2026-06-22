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
    zfs.forceImportRoot = false;
    supportedFilesystems = [ "zfs" ];

    initrd = {
      availableKernelModules = [
        "tpm_tis"
        "tpm_crb"
      ];
    };

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
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
    fprintd # Fingerprint
  ];

  system.stateVersion = "26.05";
}
