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
  nixpkgs.config.allowUnfree = true;
  
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
    plantuml
    pandoc
    jq
    alacritty
  ];
  
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      rozbo.papercolor-vscode
      ms-vscode-remote.remote-ssh
    ];

    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "papercolor-vscode"
      "telemetry.enableTelemtry" = false
      "telemetry.enableCrashReporter" = false
      "editor.fontFamily" = "Fira Code",
      "editor.fontLigatures" = true
    };
  };

  programs.fish.enable = true;
  
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;
  programs.fzf.enableFishIntegration = true;
  
  programs.alacritty = enable;

  programs.home-manager.enable = true;
  
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
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "NegentropicMan";
    userEmail = "florian.schmitz@gmail.com";
  };

  programs.command-not-found.enable = true;
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "a.sharetext" = "curl -F 'f:1=<-' ix.io";
      "a.weather" = "curl wttr.in/Nürnberg";
      "ls" = "exa"; 
    };
    
    profileExtra = pkgs.lib.fileContents ./profile.bash;
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
  };
}
