{ pkgs, ... }:

{

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true; # Recommended to fix xdg-open issues
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # For file choosers in GTK apps
      xdg-desktop-portal-hyprland # For Hyprland (or wlr for other wlroots)
    ];
    config = {
      common.default = [ "gtk" ]; # Default fallback
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
      };
    };
  };

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
