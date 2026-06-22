{ config, pkgs, ... }:

{
  time.timeZone = "America/Chicago";

  users.users.river = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    btop
    unzip
    mpv
    wl-clipboard
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };
}
