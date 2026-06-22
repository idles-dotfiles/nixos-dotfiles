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
      luks.devices."cryptroot" = {
        device = "/dev/disk/by-partlabel/luks";
        allowDiscards = true;
      };

      availableKernelModules = [
        "tpm_tis"
        "tpm_crb"
      ];
    };

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot"; # Adjust if your EFI partition is mounted elsewhere (e.g., /boot/efi)
      };
      grub = {
        enable = true;
        device = "nodev"; # "nodev" is required for EFI installs
        efiSupport = true;
        useOSProber = true; # Set to true if you are dual-booting with Windows/other distros
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
