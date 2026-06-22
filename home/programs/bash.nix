{ config, pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./starship.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bash
    bat
    fzf
    fd
    zoxide
    ripgrep
    neovim
  ];

  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lah";
      ls = "eza";
      cat = "bat";
      grep = "grep --color=auto";
    };

    historyControl = [
      "ignoredups"
      "ignorespace"
    ];

    historySize = 10000;

    initExtra = ''
      eval "$(zoxide init bash)"
      source ${pkgs.carapace}/share/bash/carapace.bash

      export EDITOR=nvim
    '';
  };
}
