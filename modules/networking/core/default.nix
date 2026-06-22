{ ... }:

{
  imports = [
    ./firewall.nix
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      dnssec = "true";
      DNSOverTLS = "true";
      domains = [ "~." ];
      fallbackDns = [
        "192.168.1.193" # Pi-hole
        "1.1.1.1" # Cloudflare
        "1.0.0.1" # Cloudflare (Secondary)
      ];
    };

  };

  networking.nftables.enable = true;
}
