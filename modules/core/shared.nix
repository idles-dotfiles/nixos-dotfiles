{ pkgs, ... }:

{
  kernelOptions = {
    stable = pkgs.linuxPackages;
    lts = pkgs.linuxPackages_6_12;
    latest = pkgs.linuxPackages_latest;
  };
}
