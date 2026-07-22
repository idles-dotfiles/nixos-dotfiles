{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.workstation.development.unity;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unityhub
      # Required for Unity/C# development
      dotnetCorePackages.dotnet_9.sdk

      # IDE for Development
      vscode

      # Mono and MSBuild (often needed for Unity integration)
      mono
      msbuild

      # NuGet (for dependency management)
      dotnetPackages.Nuget
    ];
  };
}
