{ config, pkgs, ... }:

let semantic-highlight= pkgs.vimUtils.buildVimPlugin {
      name = "semantic-highlight";
      src = pkgs.fetchFromGitHub {
        owner = "jaxbot";
        repo = "semantic-highlight.vim.git";
        rev = "8537920706fafab12a2c2a138dfb6f5c35a6b240";
        sha256 = "04975ly6zd58zhs2v07dw6m1dha0gkmfm0pvhlrgcrf2qp8n4m3v";
      };
  };
in 
{
  home.packages = with pkgs; [
    htop
    exa
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
      set relativenumber
      colorscheme PaperColor
      set nobackup
      set showcmd
      let mapleader=","
      nnoremap <Leader>s :SemanticHighlightToggle<cr>
    '';

    plugins = with pkgs.vimPlugins; [
      airline
      papercolor-theme
      vim-addon-nix
      semantic-highlight
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
      ".." = "cd ..";
      "a.sharetext" = "curl -F 'f:1=<-' ix.io";
      "a.weather" = "curl wttr.in/Nürnberg";
      exa = "ls"; 
    };
    
    profileExtra = pkgs.lib.fileContents ./profile.bash;
  };
}
