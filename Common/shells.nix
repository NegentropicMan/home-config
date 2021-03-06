{ config, lib, pkgs, ... }:

let
  shellAliases = {
    g = "git";
    e = "eval $EDITOR";
    ee = "e (fzf)";
    download = "aria2c --file-allocation=none --seed-time=0";
    ".." = "cd ..";
    "a.sharetext" = "curl -F 'f:1=<-' ix.io";
    "a.weather" = "curl wttr.in/Nürnberg";
    nix-upgrade = "sudo nixos-rebuild switch --upgrade";
  };
in
{
  home.packages = with pkgs; [
    # Programs used by shell config defined below.
    exa
    aria
    ddate
    direnv
  ];

  programs.broot = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    inherit shellAliases;
  };

  programs.autojump = {
    enable = true;
    enableFishIntegration = true;
  };
     
  programs.bash = {
    enable = true;
    historyIgnore = [ "l" "ls" "cd" "exit" ];
    historyControl = [ "erasedups" ];
    inherit shellAliases;
    initExtra = ''
    if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
      . ~/.nix-profile/etc/profile.d/nix.sh;
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    fi # added by Nix installer

    # Execute sway on login on tty1
    if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
      exec sway
    fi
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
