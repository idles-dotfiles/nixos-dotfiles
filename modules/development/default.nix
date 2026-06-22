{ config, pkgs, ... }:

{
  imports = [
    ./rust.nix
  ];

  environment.systemPackages = with pkgs; [
    # General
    git
    neovim
    nixfmt
  ];
}
