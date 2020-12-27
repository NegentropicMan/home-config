{ config, lib, pkgs, ... }:

{
  imports = [
    ./dconf.nix
  ];
  
  nixpkgs.config.allowBroken = true; #no-title-bar is marked as broken

  home.packages = with pkgs; [
    dconf2nix # For converting dconf settings (dconf dump / >dconf.settings) to a .nix file
    gnome3.eog
    gnome3.evince
    gnome3.gnome-tweak-tool
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.no-title-bar # and indeed, it does not work
  ];
  
  programs.alacritty = {
    enable = true;
    settings = {
    };
  };
}
