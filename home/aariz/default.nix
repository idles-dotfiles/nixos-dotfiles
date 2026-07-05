{ config, pkgs, ... }:

{
  home.username = "aariz";

  home.homeDirectory = "/home/aariz";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
