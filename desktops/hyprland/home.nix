{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, ghostty"
        "$mod, F, exec, brave"
      ];
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
