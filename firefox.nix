{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
 
#  services.gnome3.chrome-gnome-shell.enable = true;
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = false;
    extensions = [
    ];
  };
}
