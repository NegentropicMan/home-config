{ config, lib, pkgs, ... }:

{
  imports = [
    ./dconf.nix
  ];
  home.packages = with pkgs; [
    dconf2nix # For converting dconf settings (dconf dump / >dconf.settings) to a .nix file
    gnome3.eog
    gnome3.evince
    gnome3.gnome-tweak-tool
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
  ];
  
}
