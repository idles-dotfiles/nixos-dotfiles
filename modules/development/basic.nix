{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gitFull
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
      zed-editor
    ];

    # Nix LSP
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

  };
}
