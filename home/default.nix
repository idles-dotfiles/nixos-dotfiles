{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/starship.nix
    ./programs/git.nix
  ];

  home.username = "river";
  home.homeDirectory = "/home/river";
  home.stateVersion = "26.05"; # Update this when changing nixpkgs releases
}
