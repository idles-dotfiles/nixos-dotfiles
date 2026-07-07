{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    hyprlock
    hyprshot
    rofi
    networkmanagerapplet
    kdePackages.dolphin
    wayvnc
    awww
    mpvpaper
    waybar
    quickshell
    qt6.qtdeclarative
    wlogout
  ];
}
