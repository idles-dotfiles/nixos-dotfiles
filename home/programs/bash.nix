{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      cd = "z";
      cat = "bat";
      ocat = "\cd"; # The \ is used to prevent alias expansion in the alias definition
      docker = "podman";
      ls = "eza --icons";
      ols = "\ls";
      kubectx = "kubectl config use-context";

      # Nix Stuff
      nrs = "sudo nixos-rebuild switch --flake ~/Dotfiles#laptop";
      update = "nix flake update --flake ~/Dotfiles#laptop";
      upgrade = "update && nrs";

      # Single Letter Aliases
      v = "nvim";
    };

    initExtra = ''
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"
      source ${pkgs.carapace}/share/bash/carapace.bash
      export EDITOR=nvim
    '';
  };

  # Just to make sure pkgs are installed
  home.packages = with pkgs; [
    bat
    eza
    zoxide
    carapace
    neovim
    kubectl
  ];
}
