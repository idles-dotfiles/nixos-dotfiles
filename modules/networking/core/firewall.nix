{ config, ... }:
let
  cfg = config.workstation.networking.core.firewall;
in
{
  networking.firewall = {
    enable = true;

    allowPing = cfg.allowPing;

    allowedTCPPorts = cfg.ports.tcp;
    allowedUDPPorts = cfg.ports.udp;
  };
}
