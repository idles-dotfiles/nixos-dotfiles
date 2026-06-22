{ ... }:

{
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.2/24" ];
      privateKeyFile = "/etc/wireguard/private.key"; # Keep secrets out of the nix store!

      peers = [
        {
          publicKey = "vUUL4CD+1Sa2U2SZYa2P9IoFC2HxEr+PYNmYfRE8wwY=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "server.maariz.org:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  # Ensure the Wireguard UDP port is open if you are hosting the server
  networking.firewall.allowedUDPPorts = [ 51820 ];
}
