{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  ];
  
  home.sessionVariables = {
    LOCALE_ARCHIVE = "/usr/lib/locale/locale-archive";
  };
}
