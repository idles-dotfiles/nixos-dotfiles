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
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "192.168.1.193" # Pi-hole
      "1.1.1.1" # Cloudflare
      "1.0.0.1" # Cloudflare (Secondary)
    ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  networking.nftables.enable = true;
}
