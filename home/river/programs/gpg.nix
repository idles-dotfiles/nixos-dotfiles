{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    maxCacheTtl = 1800;
    pinentry.package = pkgs.pinentry-qt;
  };

  services.gpg-agent.extraConfig = ''
    pinentry-program ${pkgs.pinentry-qt}/bin/pinentry
  '';

  programs.gpg = {
    enable = true;
    settings = {
      auto-key-locate = "local,wkd,keyserver";
      keyserver = "hkps://keys.openpgp.org";
    };
  };
}
