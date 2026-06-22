{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ../desktops/hyprland/home.nix
  ];

  home.username = "river";
  home.homeDirectory = "/home/river";

  home.stateVersion = "26.05";
}
