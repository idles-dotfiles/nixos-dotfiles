{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/git.nix
  ];

  home.file = {
    ".config/hypr".source = ./config/hypr;
    ".config/tmux".source = ./config/tmux;
  };

  home.username = "river";
  home.homeDirectory = "/home/river";

  home.stateVersion = "26.05";
}
