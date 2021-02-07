{ config, pkgs, ... }:
let
  format_udf = pkgs.callPackage ./format-udf.nix {};
in
{
  imports = [
    ./git.nix
    ./shells.nix
    ./nvim.nix
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
  };

  home.packages = with pkgs; [
    format_udf
    nix-prefetch-git
    nix-index
    nox
    stress
    lshw
    vis
  ];

  home.sessionVariables.EDITOR = "vis";

  services.mpd = {
    enable = true;
    musicDirectory = "/home/fschmitz/Music";
    extraConfig = ''
      audio_output {
        type "pulse" # MPD must use Pulseaudio
	name "Pulseaudio" # Whatever you want
      }
      '';   
  };
}
