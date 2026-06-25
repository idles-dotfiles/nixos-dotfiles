{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "America/Chicago";

  programs.fish.enable = true;

  users.users.river = {
    isNormalUser = true;
    description = "Maaz Khokhar";
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
    ];

    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    btop
    unzip
    mpv
    wl-clipboard
    ghostty
    wireplumber
    brightnessctl
    pulseaudio
    pavucontrol
    ghostty
    git-credential-manager
    gnupg
    yazi
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      trusted-users = [
        "root"
        "river"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };

  programs.nix-ld.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  security.rtkit.enable = true;

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
    };

    printing.enable = true;
  };
}
