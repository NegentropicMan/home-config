{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    htop
    fortune
    broot
    screen
    byobu
    eweb
    asciidoctor
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "NegentropicMan";
    userEmail = "florian.schmitz@gmail.com";
  };
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "pi";
  home.homeDirectory = "/home/pi";

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
