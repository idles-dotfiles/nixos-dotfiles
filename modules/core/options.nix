{
  lib,
  shared,
  ...
}:
{
  options.workstation.core = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = "Hostname of the machine";
    };

    kernel = lib.mkOption {
      type = with lib.types; enum (builtins.attrNames shared.kernelOptions);
      default = "lts";
      description = "The kernel of the machine";
    };

    user = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "river";
        description = "The username of the primary user";
      };

      fullName = lib.mkOption {
        type = lib.types.str;
        default = "Maaz Khokhar";
        description = "The full name of the user";
      };

      shell = lib.mkOption {
        type = lib.types.str;
        default = "fish";
        description = "The shell the primary user uses";
      };
    };

    allowUnfree = lib.mkEnableOption "unfree packages" // {
      default = true;
    };

    ssh = {
      permitRootLogin = lib.mkEnableOption "root SSH login";
    };
  };
}
