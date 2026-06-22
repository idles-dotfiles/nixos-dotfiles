{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
  ];

  environment.variables = {
    RUST_BACKTRACE = "1";
  };
}
