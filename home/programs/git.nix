{ ... }:

{
  programs.git = {
    enable = true;
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
