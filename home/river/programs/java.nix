{ pkgs, ... }:

{
  home.file.".java/jdk-17".source = pkgs.jdk17;
  home.file.".java/jdk-25".source = pkgs.jdk25;
}
