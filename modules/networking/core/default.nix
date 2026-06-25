{ ... }:

{
  imports = [
    ./firewall.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    extraHosts = "192.168.1.60 laptop";
    nftables.enable = true;

    nameservers = [
      "192.168.1.193" # Pi-hole
      "1.1.1.1" # Cloudflare
      "1.0.0.1" # Cloudflare (Secondary)
    ];
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
}
