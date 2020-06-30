{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    fortune
    broot
    screen
    byobu
    eweb
    asciidoctor
    imagemagick
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.git = {
    enable = true;
    userName = "NegentropicMan";
    userEmail = "florian.schmitz@gmail.com";
  };
}
