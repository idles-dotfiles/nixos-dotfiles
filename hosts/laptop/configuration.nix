{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
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

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowPing = true;

      allowedTCPPorts = [ 22 80 ];
      allowedUDPPorts = [ 51820 ];
    }
  };

  time.timeZone = "America/Chicago";

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;

  networking.hostId = "8425e349";

  users.users.river = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "podman"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    btop
    unzip
    tpm2-tools
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  system.stateVersion = "26.05";
}
