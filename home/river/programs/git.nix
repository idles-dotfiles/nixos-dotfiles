{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Maaz Khokhar";
        email = "khokharmaaz@gmail.com";
      };
      signing = {
        key = "0xA8D1AEA9C92D6867"; # e.g., "0x1234567890ABCDEF"
        signByDefault = true;
      };

      credential.helper = "libsecret";

      extraConfig = {
        commit.gpgSign = true;
        tag.gpgSign = true;
        gpg.program = "${pkgs.gnupg}/bin/gpg";
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };

  programs.delta = {
    enable = true;
    options = {
      features = "decorations interactive";
      navigate = true;
      hyperlinks = true;
    };
  };
}
