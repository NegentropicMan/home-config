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
    vimdiffAlias = true;

    extraConfig = ''
      colorscheme PaperColor
    '';

    plugins = with pkgs.vimPlugins; [
      airline
      papercolor-theme
      vim-addon-nix
    ];
  };

  programs.git = {
    enable = true;
    userName = "NegentropicMan";
    userEmail = "florian.schmitz@gmail.com";
  };
}
