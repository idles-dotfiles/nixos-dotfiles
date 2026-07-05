{ ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "khokharmaaz@gmail.com";
        name = "Maaz Khokhar";
      };

      signing = {
        behavior = "own";
        backend = "gpg";
        key = "A8D1AEA9C92D6867";
      };

      ui.color = "always";
    };
  };
}
