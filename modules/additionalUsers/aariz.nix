{ pkgs, ... }:

{
  users.users.aariz = {
    isNormalUser = true;
    description = "Aariz Khokhar";
    packages = with pkgs; [ google-chrome ];
    shell = pkgs.bash;
  };
}