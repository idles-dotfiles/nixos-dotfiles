{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "laptop";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.river = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "kvm"
    ];
  };

  programs.firefox.enable = true;
  programs.virt-manager.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    btop
    ghostty
    starship
    tmux
    zoxide
    fd
    ripgrep
    fzf
    cmatrix
  ];

  virtualization = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      dockerCompat = true; # lets you use `docker` commands → podman
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  services.openssh.enable = true;
  services.code-server = {
    enable = true;
    port = 8080;
    host = "127.0.0.1";
    user = "river";
    hashedPassword = "$argon2i$v=19$m=4096,t=3,p=1$Y2FLOGxUbVZrQWhUVUxlQnR4Z3MrNUd5ZVpFPQ$QZllzyC8qFmODAS9xW8OqPI5FoVoenYNKvbNMn+KTro";
  };
  services.caddy = {
    enable = true;
    package = pkgs.caddy;
    extraConfig = ''
      :80

      reverse_proxy localhost:8080
    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
    ];
  };

  system.stateVersion = "26.05";

}
