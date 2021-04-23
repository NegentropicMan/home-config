{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./shells.nix
    ./nvim.nix
    ./format-udf.nix
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
  };

  home.packages = with pkgs; [
    nix-prefetch-git
    nix-index
    nox
    stress
    lshw
    vis
    lorri
    mtm
  ];
  xdg.configFile = {
    VisConfig = {
      target = "vis";
      source = ./config/vis;
      recursive = true;
    };
    
    VisFiletypeSettings = {
      target = "./vis/vis-filetype-settings"; 
      source = pkgs.fetchFromGitHub {
        owner = "jocap";
        repo = "vis-filetype-settings";  
        rev = "60f8fa3494d1981ede502f4caf8b471d25de759d";
        sha256 = "08afr567km7278pjjipykhikink0iqhj8wjj379d2vzsiavjsd27";
      };
      recursive = false;
   };
  };

  home.sessionVariables.EDITOR = "vis";

  services.mpd = {
    enable = true;
    musicDirectory = "/home/fschmitz/Music";
    extraConfig = ''
      audio_output {
        type "pulse"  MPD must use Pulseaudio
        name "Pulseaudio"  Whatever you want
      }
      '';   
  };
}
