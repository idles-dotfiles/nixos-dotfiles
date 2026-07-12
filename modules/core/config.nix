{
  config,
  pkgs,
  shared,
  ...
}:
let
  cfg = config.workstation.core;
  allowRootSSH = if cfg.ssh.permitRootLogin then "yes" else "no";
in
{
  config = {
    networking.hostName = cfg.hostname;

    boot = {
      kernelPackages = shared.kernelOptions.${cfg.kernel};
      loader = {
        systemd-boot = {
          enable = true;
          editor = true;
        };
        efi.canTouchEfiVariables = true;
      };
    };

    time.timeZone = "America/Chicago";

    programs.${cfg.user.shell}.enable = true;

    users.users.${cfg.user.name} = with cfg.user; {
      isNormalUser = true;
      description = fullName;
      extraGroups = [
        "wheel"
        "networkmanager"
        "input"
      ];

      shell = pkgs.${shell};
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      gitFull
      neovim
      git-credential-manager
      gnupg
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
          cfg.user.name
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

      openssh = {
        enable = true;
        settings.PermitRootLogin = allowRootSSH;
      };
    };
    system.stateVersion = "26.11";
  };
}
