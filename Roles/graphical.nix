{ config, pkgs, ... }:

{
  imports = [ 
    ./Apps/fonts.nix
    ./Apps/sway.nix
    ./Apps/firefox.nix
    #./Apps/vscode.nix
  ];

  home.packages = with pkgs; [
    zathura
    cantata
    dropbox
    qutebrowser
  ];

  home.sessionVariables."_JAVA_AWT_WM_NONREPARENTING" = "1"; # For Java/AWT programs which do not like wayland
}
