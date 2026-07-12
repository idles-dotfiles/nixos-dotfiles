{ config, lib, ... }:
let
  cfg = config.workstation.networking.wireguard;
in
{
  config = lib.mkIf cfg.enable {
    networking.wg-quick.interfaces = lib.mapAttrs (name: iface: {
      address = iface.address;
      privateKeyFile = iface.privateKeyFile;
      peers = map (p: {
        publicKey = p.publicKey;
        allowedIPs = p.allowedIPs;
        endpoint = p.endpoint;

        persistentKeepalive = if p.persistentKeepalive != null then p.persistentKeepalive else null;
      }) iface.peers;
    }) (lib.filterAttrs (_: v: v.enable) cfg.interfaces);

    networking.firewall.allowedUDPPorts = [ 51820 ];
  };
}
