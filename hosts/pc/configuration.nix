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
    ../../modules/bitwarden

    # Desktop
    ../../desktops/plasma
    ../../desktops/hyprland
  ];

  environment.systemPackages = with pkgs; [
    libsecret
    tree
    libxtst
    usbutils
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
    xclicker
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
    wine64Packages.waylandFull
  ];

  programs.kdeconnect.enable = true;

  services.keyd = {
    enable = false;

    keyboards.default = {
      ids = [ "*" ];

      settings = {
        main = {
          right = "w";
        };
      };
    };
  };

  workstation = {
    core = {
      kernel = "latest";
      allowUnfree = true;
      ssh.permitRootLogin = true;

      user = {
        name = "river";
        fullName = "Maaz Khokhar";
        shell = "fish";
      };
    };

    networking = {
      core = {
        firewall = {
          allowPing = true;
          ports.tcp = [
            22
            80
            5900
            16570
            18789
          ];
        };
        extraHosts = [
          {
            ip_address = "192.168.1.60";
            hostname = "laptop";
          }
        ];
        nameservers = [
          "192.168.1.58"
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
      tailscale.enable = true;
    };

    virtualization = {
      user = "river";

      qemu = {
        enable = true;
        containers = true;
        spiceUSBRedirection = true;
        virtManager = true;
        bootModules = [
          "kvm-amd"
        ];
      };

      podman = {
        enable = true;
        packages.enable = true;
      };

      lima.enable = true;
    };

    development = {
      enable = true;
      rust.enable = true;
      typescript.enable = true;
      go.enable = true;
      engines = {
        unity.enable = false;
        robloxstudio.enable = true;
      };
    };

    bitwarden.enable = true;
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
}
