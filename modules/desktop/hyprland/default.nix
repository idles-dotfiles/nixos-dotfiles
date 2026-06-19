{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    quickshell
    hyprlock
    mpvpaper
    hyprsunset
    hyprpicker
    hyprpolkitagent
    hyprshot
  ];
  programs.hyprland.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  }

  # Fingerprint
  services.fprintd.enable = true;
}
