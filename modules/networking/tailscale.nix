{ config, lib, ... }:
let
  cfg = config.workstation.networking.tailscale;
  user = config.workstation.networking.user;
in
{
  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      openFirewall = true;
      extraSetFlags = [ "--operator=${user}" ];
    };

    networking.firewall = {
      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };

    systemd.services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];

    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;

    users.users.${user}.extraGroups = [
      "tailscale"
    ];
  };
}
