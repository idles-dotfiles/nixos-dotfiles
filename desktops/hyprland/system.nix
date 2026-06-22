{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
