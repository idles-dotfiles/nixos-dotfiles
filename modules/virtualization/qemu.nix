{ pkgs, ... }:

{
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation = {
    containers.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
  };

  programs.virt-manager.enable = true;

  users.users.river.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  boot.kernelModules = [
    "kvm-intel"
    "kvm-amd"
  ];
}
