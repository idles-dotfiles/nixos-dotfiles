{ pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./starship.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    fish
    bat
    fzf
    fd
    zoxide
    ripgrep
    neovim
  ];

  home.file.".config/fish".source = ../config/fish;

  programs.fish.enable = true;
}
