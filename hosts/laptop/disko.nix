{ disk, ... }:

{
  disko.devices.disk.main = {
    type = "disk";
    device = disk;
    content = {
      type = "gpt";

      partitions = {
        ESP = {
          size = "1G";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        luks = {
          size = "100%";

          content = {
            type = "luks";
            name = "cryptroot";

            # important: allow TPM-based unlocking
            settings = {
              allowDiscards = true;
            };

            # this is key for TPM workflows
            initrdUnlock = true;

            content = {
              type = "zfs";
              pool = "rpool";
            };
          };
        };
      };
    };
  };

  zpool.rpool = {
    type = "zpool";

    rootFsOptions = {
      compression = "zstd";
      "com.sun:auto-snapshot" = "true";
    };

    datasets = {
      root = {
        type = "zfs_fs";
        mountpoint = "/";
      };

      nix = {
        type = "zfs_fs";
        mountpoint = "/nix";
      };

      home = {
        type = "zfs_fs";
        mountpoint = "/home";
      };
    };
  };
}
