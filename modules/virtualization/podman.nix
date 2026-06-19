{
  config,
  lib,
  pkgs,
  ...
}:
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  users.users.river.extraGroups = [ "podman" ];

  environment.systemPackages = with pkgs; [
    podman
    podman-compose
  ];
}
