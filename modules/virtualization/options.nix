{
  lib,
  ...
}:
{
  options.workstation.virtualization = {
    user = lib.mkOption {
      type = lib.types.str;
      default = "river";
      description = "The user to run virtualization services as.";
    };

    # podman
    podman = {
      enable = lib.mkEnableOption "Podman support";

      packages = {
        enable = lib.mkEnableOption "relevant Podman packages";
      };
    };

    # qemu
    qemu = {
      enable = lib.mkEnableOption "QEMU support";

      containers = lib.mkEnableOption "container support for QEMU";

      spiceUSBRedirection = lib.mkEnableOption "spice USB redirection support for QEMU";

      virtManager = lib.mkEnableOption "virt-manager support for QEMU";

      bootModules = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "kvm-intel"
          "kvm-amd"
        ];
        description = "The kernel modules to load for QEMU support.";
      };
    };

    lima = {
      enable = lib.mkEnableOption "Lima lite VM";
    };
  };
}
