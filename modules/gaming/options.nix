{
  lib,
  shared,
  ...
}:
{
  options.workstation.gaming = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable gaming on the machine";
    };

    macro = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable macro support";
      };
    };
  };
}
