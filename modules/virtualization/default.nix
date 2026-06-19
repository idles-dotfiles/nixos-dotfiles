{ config, lib, ... }:

{
  imports = [
    ./qemu.nix
    ./podman.nix
  ];
}
