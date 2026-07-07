{ pkgs, ... }:

{
  virtualisation = {
    oci-containers.backend = "podman";
    containers.registries.search = [ "docker.io" ];
    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # For rootless containers
  security.unprivilegedUsernsClone = true;

  users.users.river = {
    subUidRanges = [
      {
        startUid = 100000;
        count = 65536;
      }
    ];
    subGidRanges = [
      {
        startGid = 100000;
        count = 65536;
      }
    ];

    extraGroups = [
      "podman"
    ];
  };

  environment.systemPackages = with pkgs; [
    podman
    podman-compose
    podman-desktop
  ];
}
