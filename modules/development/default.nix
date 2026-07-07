{ inputs, pkgs, ... }:

{
  imports = [
    ./rust.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    nixfmt
    nixd
    kubectl
    jq
    tmux
    vscode
    devenv
    xh
    nodejs
    obsidian
  ];

  # Nix LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
