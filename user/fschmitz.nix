{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "fschmitz";
  home.homeDirectory = "/home/fschmitz";
}
