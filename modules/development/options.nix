{ lib, ... }:
{
  options.workstation.development = {
    enable = lib.mkEnableOption "the basic development toolkit";

    clang = {
      enable = lib.mkEnableOption "the clang toolkit";
    };

    claude = {
      enable = lib.mkEnableOption "the AI harness";
    };

    go = {
      enable = lib.mkEnableOption "the go toolkit";
    };

    python = {
      enable = lib.mkEnableOption "the python toolkit";
    };

    rust = {
      enable = lib.mkEnableOption "the rust toolkit";
    };

    typescript = {
      enable = lib.mkEnableOption "the typescript toolkit";
    };

    unity = {
      enable = lib.mkEnableOption "the unity toolkit";
    };
  };
}
