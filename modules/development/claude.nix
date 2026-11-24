{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.workstation.development.claude;
  user = config.workstation.core.user.name;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      opencode
      inputs.claude-desktop.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    # Required for Cowork VM
    boot.kernelModules = [ "vhost_vsock" ];
    users.users.${user}.extraGroups = [ "kvm" ];
  };
}
