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

  networking.firewall.trustedInterfaces = [ "virbr0" ];

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
