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
  with pkgs; neovim.override {
    configure = {
      # Builtin packaging
      # List of plugins: nix-env -qaP -A nixos.vimPlugins
      packages.myVimPackage = with pkgs.vimPlugins; {
        # Loaded on launch
        start = [ ];
        # Manually loadable by calling `:packadd $plugin-name
        opt = [ ];
      };

      # VAM
      vam.knownPlugins = pkgs.vimPlugins // customPlugins;
      vam.pluginDictionaries = [
        { name = "semantic-highlight"; }
        { name = "papercolor-theme"; }
        { name = "vim-addon-nix"; }
        { name = "airline"; }
      ];
    };
  }
