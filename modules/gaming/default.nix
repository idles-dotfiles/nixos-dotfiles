{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
    prismlauncher
    nvtopPackages.amd
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.gamemode.enable = true;

  # GPU Driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      vulkan-validation-layers
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
