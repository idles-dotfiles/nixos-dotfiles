{ lib, ... }:

{
  options.workstation.bitwarden = {
    enable = lib.mkEnableOption "Bitwarden password manager";

    menu.enable = lib.mkEnableOption "Bitwarden Rofi/Dmenu frontend";
  };
}
