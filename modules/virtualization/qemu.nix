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
    (lib.mkIf cfg.qemu.enable {
      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            package = pkgs.qemu_kvm;
            swtpm.enable = true;
          };
        };
      };
      users.users.${cfg.user}.extraGroups = [
        "libvirtd"
        "kvm"
      ];
    })

    (lib.mkIf cfg.qemu.spiceUSBRedirection {
      virtualisation.spiceUSBRedirection.enable = true;
    })

    (lib.mkIf cfg.qemu.virtManager {
      programs.virt-manager.enable = true;
    })

    (lib.mkIf (cfg.qemu.enable && cfg.qemu.containers) {
      virtualisation.containers.enable = true;
    })

    (lib.mkIf cfg.qemu.enable {
      boot.kernelModules = cfg.qemu.bootModules;
    })
  ];
}
