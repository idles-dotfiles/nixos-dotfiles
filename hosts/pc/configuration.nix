{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    # Modules
    ../../modules/core
    ../../modules/networking
    ../../modules/bluetooth
    ../../modules/gaming
    ../../modules/virtualization
    ../../modules/ollama
    ../../modules/development
    ../../modules/development/claude.nix
    ../../modules/development/go.nix
    ../../modules/additionalUsers/aariz.nix
    ../../modules/obs

    # Desktop
    ../../desktops/plasma
    ../../desktops/hyprland
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  environment.systemPackages = with pkgs; [
    libsecret
    tree
    libxtst
    usbutils
    brave
    pciutils
    stow
    termius
    kdePackages.partitionmanager
    python3
    fastfetch
    localsend
    nvtopPackages.amd
    pass
    pinentry-curses
    github-copilot-cli
    xautoclick
    tsx
    slack
    mosh
    code-cursor
    kdePackages.kdenlive
    kdePackages.kwallet
    kdePackages.kwallet-pam
    element-desktop
    cmatrix
    rustdesk
  ];

  programs.kdeconnect.enable = true;
  services.keyd = {
    enable = false;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        capslock = "up";
        up = "w";
      };
    };
  };

  programs.nix-ld.libraries = with pkgs; [
    brotli
    stdenv.cc.cc.lib
  ];

  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
  services.flatpak.enable = true;

  networking.firewall.allowedTCPPorts = [
    5900
    16570
    18789
  ];

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  system.stateVersion = "25.11";
}
