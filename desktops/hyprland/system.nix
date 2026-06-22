{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.displayManager.sddm.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    hyprpicker
    mpvpaper
    quickshell
    hyprpolkitagent
    rofi
  ];
}
