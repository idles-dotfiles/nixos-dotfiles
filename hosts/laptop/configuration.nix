{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/virtualization
    ../../modules/desktop/plasma
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
    ];
  };

  programs.firefox.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    btop
    ghostty
    starship
    tmux
    mpv
    zoxide
    fd
    ripgrep
    fzf
    cmatrix
    vscode
  ];

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
