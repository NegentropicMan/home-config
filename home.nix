{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
#    ./machine/pi.nix
#    ./role/remoteenv.nix
#    ./role/devmachine.nix
    ./user/fschmitz.nix
    ./fonts.nix
    ./git.nix
    ./shells.nix
    ./nvim.nix
    ./i3.nix
    ./gnome.nix
    ./firefox.nix
    ./vscode.nix
  ];
  
  home.packages = with pkgs; [
    nix-prefetch-git
    stress
    guake
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
