{ pkgs, ... }:

let
  shared = import ./shared.nix { inherit pkgs; };
in
{
  imports = [
    ./options.nix
    ./config.nix
  ];

  _module.args.shared = shared;
}
