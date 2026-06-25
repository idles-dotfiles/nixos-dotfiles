{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    maxCacheTtl = 1800;
    pinentry.package = pkgs.pinentry-curses;
  };

  programs.gpg = {
    enable = true;
    settings = {
      auto-key-locate = "local,wkd,keyserver";
      keyserver = "hkps://keys.openpgp.org";
    };
  };
}