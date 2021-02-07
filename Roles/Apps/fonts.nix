{ config, lib, pkgs, ... }:

{
   fonts.fontconfig.enable = true;
   home.packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome-ttf
      powerline-fonts
    ];
}
