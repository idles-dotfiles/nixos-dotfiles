{ ... }:

{
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
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
