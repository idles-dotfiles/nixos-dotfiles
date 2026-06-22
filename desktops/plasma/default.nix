{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];
}
