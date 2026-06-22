{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python313

    # package tooling
    python313Packages.uv
    python313Packages.virtualenv

    # dev tools
    ruff
    black
    mypy

    # optional data science base tools
    python313Packages.numpy
    python313Packages.pandas
  ];
}
