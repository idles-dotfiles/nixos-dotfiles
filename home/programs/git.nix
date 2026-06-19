{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Maaz Khokhar";
        email = "khokharmaaz@gmail.com";
      };

      init.defaultBranch = "main";
    };
  };
}
