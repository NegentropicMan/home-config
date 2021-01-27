{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./user/fschmitz.nix
    ./fonts.nix
    ./git.nix
    ./shells.nix
    ./nvim.nix
    #./i3.nix
    ./sway.nix
    ./firefox.nix
    ./vscode.nix
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
  };
  
  home.packages = with pkgs; [
    nix-prefetch-git
    nix-index
    stress
    mudlet    
    mupdf
    mpd
    cantata
    dropbox
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
