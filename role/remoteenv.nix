{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    fortune
    broot
    screen
    tmux
    byobu
    eweb
    asciidoctor
    imagemagick
    python3
  ];

  programs.fish.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      colorscheme PaperColor
      set relativenumber
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

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "a.sharetext" = "curl -F 'f:1=<-' ix.io";
      "a.weather" = "curl wttr.in/Nürnberg";
    
    };
    
    profileExtra = pkgs.lib.fileContents ./profile.bash;
  };
}
