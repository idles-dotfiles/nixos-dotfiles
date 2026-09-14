{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.virtualization;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.podman.enable {
      virtualisation = {
        oci-containers.backend = "podman";
        podman = {

          enable = true;

          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };

      # For rootless containers
      boot.kernel.sysctl."user.max_user_namespaces" = 28633;

      users.users.${cfg.user} = {
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
    })

    (lib.mkIf cfg.podman.packages.enable {
      environment.systemPackages = with pkgs; [
        podman
        podman-compose
        podman-desktop
      ];
    })
  ];
}
