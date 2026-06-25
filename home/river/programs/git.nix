{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user = {
        name = "Maaz Khokhar";
        email = "khokharmaaz@gmail.com";
      };
      commit.gpgSign = true;
      tag.gpgSign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      init.defaultBranch = "main";
      pull.rebase = true;
      credential.helper = "libsecret";
      push.autoSetupRemote = true;
    };

    signing = {
      key = "0xA8D1AEA9C92D6867";
      signByDefault = true;
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
