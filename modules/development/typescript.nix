{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bun

    # TS tooling (optional but common)
    typescript
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.prettier
  ];

  environment.variables = {
    NODE_OPTIONS = "--max-old-space-size=4096";
  };
}
