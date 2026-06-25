{ pkgs, ... }:

{

  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/gpg.nix
    ./programs/fish.nix
    ./programs/vesktop.nix
    ./programs/java.nix
    #./programs/neovim.nix
  ];

  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      git
      bash
      fish
      vesktop
      neovim
      tmux
    ];

    file = {
      ".config/hypr".source = ./config/hypr;
      ".config/tmux".source = ./config/tmux;
      ".config/ghostty".source = ./config/ghostty;
      ".config/nvim".source = ./config/nvim;
      ".config/fish".source = ./config/fish;
    };

    sessionVariables = {
      EDITOR = "nvim";
    };

    username = "river";
    homeDirectory = "/home/river";

    stateVersion = "26.05";
  };
}
