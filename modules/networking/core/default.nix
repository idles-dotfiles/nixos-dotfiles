{ config, lib, ... }:
let
  cfg = config.workstation.networking.core;
in
{
  imports = [
    ./firewall.nix
  ];

  config = {
    networking = {
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };

      extraHosts = lib.concatMapStringsSep "\n" (
        host: "${host.ip_address} ${host.hostname}"
      ) cfg.extraHosts;

      nftables.enable = true;

      nameservers = cfg.nameservers;
    };

    services.resolved = {
      enable = true;

      settings.Resolve = {
        dnssec = "true";
        DNSOverTLS = "true";
        domains = [ "~." ];
        fallbackDns = cfg.nameservers;
      };

    };
  };
}
