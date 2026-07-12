{
  lib,
  ...
}:
{
  options.workstation.networking = {
    user = lib.mkOption {
      type = lib.types.str;
      default = "river";
      description = "The user to run tailscale's services as.";
    };

    # core
    core = {
      firewall = {
        allowPing = lib.mkEnableOption "ICMP pinging" // {
          default = true;
        };

        ports = {
          tcp = lib.mkOption {
            type = with lib.types; listOf number;
            default = [
              22
              80
            ];
          };
          udp = lib.mkOption {
            type = with lib.types; listOf number;
            default = [ 53 ];
          };
        };
      };

      extraHosts = lib.mkOption {
        type =
          with lib.types;
          listOf (
            submodule (
              { ... }: {
                options = {
                  ip_address = lib.mkOption {
                    type = str;
                  };

                  hostname = lib.mkOption {
                    type = str;
                  };
                };
              }
            )
          );

        default = [ ];
        description = "Additional hosts to add.";
      };

      nameservers = lib.mkOption {
        type = with lib.types; listOf str;

        default = [
          "192.168.1.193"
          "1.1.1.1"
          "1.0.0.1"
        ];
        description = "DNS Resolvers for System";
      };
    };

    # wireguard
    wireguard = {
      enable = lib.mkEnableOption "Wireguard support";

      interfaces = lib.mkOption {
        type = lib.types.attrsOf (
          lib.types.submodule {
            options = {
              enable = lib.mkEnableOption "Enable this WG interface";

              address = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ ];
              };

              privateKeyFile = lib.mkOption {
                type = lib.types.str;
              };

              peers = lib.mkOption {
                type = lib.types.listOf (
                  lib.types.submodule {
                    options = {
                      publicKey = lib.mkOption { type = lib.types.str; };
                      allowedIPs = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        default = [ ];
                      };
                      endpoint = lib.mkOption {
                        type = lib.types.str;
                        default = "";
                      };
                      persistentKeepalive = lib.mkOption {
                        type = lib.types.nullOr lib.types.int;
                        default = null;
                      };
                    };
                  }
                );
                default = [ ];
              };
            };
          }
        );
      };
    };

    # tailscale
    tailscale = {
      enable = lib.mkEnableOption "Tailscale mesh VPN";
    };
  };
}
