# Based on [Ali Abrar](https://github.com/ali-abrar)'s Vim configuration.

{ pkgs ? import <nixpkgs> {}, ... }:

let
# cf. https://nixos.wiki/wiki/Vim#Adding_new_plugins 

customPlugins = {
  semantic-highlight= pkgs.vimUtils.buildVimPlugin {
    name = "semantic-highlight";
    src = pkgs.fetchFromGitHub {
      owner = "jaxbot";
      repo = "semantic-highlight.vim.git";
      rev = "8537920706fafab12a2c2a138dfb6f5c35a6b240";
      sha256 = "04975ly6zd58zhs2v07dw6m1dha0gkmfm0pvhlrgcrf2qp8n4m3v";
    };
  };

  papercolor-theme = pkgs.vimUtils.buildVimPlugin {
    name = "papercolor-theme";
    src = pkgs.fetchFromGitHub {
      owner = "NLKNguyen";
      repo = "papercolor-theme";
      rev = "ddd0986";
      sha256 = "1dhbnd99xs6l5alqhn9m1nynmr9sbvrqj2137l23ysisprl3rgmr";
    };
  };
};
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      set expandtab
      set softtabstop=2
      set shiftwidth=2
      set relativenumber
      " If this is too cumbersome, use "*(y/p) to use the system clipboard
      " set clipboard=unnamedplus
      colorscheme PaperColor
      set bg=dark
      set nobackup
      set showcmd
      set nowrap
      let mapleader=","
      " set foldmethod=indent
      set wildmenu " Shows an extended menu for command expansion
      nnoremap <Leader>s :SemanticHighlightToggle<cr>
      " Save and load the curren view (folds) of the file automatically
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent loadview
      '';

    plugins = with pkgs.vimPlugins // customPlugins; [
      airline
        papercolor-theme
        vim-addon-nix
        semantic-highlight
    ];
  };
}
