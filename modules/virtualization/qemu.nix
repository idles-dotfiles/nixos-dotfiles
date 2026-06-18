{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.libvirtd.qemu = {
    ovmf.enable = true;
    swtpm.enable = true;
  };

  boot.kernelModules = [
    "kvm-intel"
    "kvm-amd"
  ];

  users.users.river.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
  ];
}
