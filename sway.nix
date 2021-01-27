{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  focus = "#D75F00";
  unfocus = "#EEEEEE";
in {
  imports = [
  ];
  home.packages = with pkgs; [
    autotiling # toggle between horizontal and vertical tiling (spiral)
    flashfocus
    foot #Terminal emulator
    kanshi # autorandr
    mako # Notification daemon
    mupdf
    networkmanagerapplet
    swayidle
    swaylock
    waybar
    wl-clipboard
    wofi # dmenu replacement
    xfce.thunar
  ];

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };

  home.sessionVariables = {
    BROWSER = "firefox";
  };
  
  xdg.configFile = {
    NurEinName = {
      target = "./blubbdir/blubb.conf";
      source = ./blubb.conf;
    };
    NurEinAndererName = {
      target = "./bladir/bla.conf";
      text = ''
	bla.conf text source
      '';
    };
    WaybarConfig = {
      target = "./waybar";
      source = ./config/waybar;
      recursive = false; # If false, the directory is linked. If true, the files are linked
    };
    MakoConfig = {
      target = "./mako";
      source = ./config/mako;
      recursive = false; # If false, the directory is linked. If true, the files are linked
    };
  };
  
  wayland = {
     windowManager.sway = {
       enable = true;
       wrapperFeatures.gtk = true;
       config = {
        input = {
	  "type:keyboard" = {
	    "xkb_layout" = "de";
	    "xkb_variant" = "nodeadkeys";
	  };
	};
	startup = [
	  { command = "dropbox"; } 
	];
	terminal = ''foot --font="Fira Code:size=10"'';
	menu = "wofi --show drun";
	modifier = mod;
        #fonts = ["DejaVu Sans Mono, FontAwesome 6"];
        fonts = ["Fira Code:size=10"];
        colors = {
            focused = {
              border = focus;
              childBorder = focus;
              background = focus;
              text = focus;
              indicator = focus;
            };
            focusedInactive = {
              border = unfocus;
              childBorder = unfocus;
              background = unfocus;
              text = unfocus;
              indicator = unfocus;
            };
            unfocused = {
              border = unfocus;
              childBorder = unfocus;
              background = unfocus;
              text = unfocus;
              indicator = unfocus;
            };
            urgent = {
              border = focus;
              childBorder = focus;
              background = focus;
              text = focus;
              indicator = focus;
            };
            background = unfocus;
        }; # colors end
        
        floating.modifier = mod;
        
        gaps.inner = 3;
        gaps.smartGaps = true;
        gaps.smartBorders = "on";

        keybindings = lib.mkOptionDefault {
        #  "${mod}+Return" = "exec st -f 'FiraCode:size=12:autohint=true:antialias=true' -e tmux"; # FantasqueSansMono
        #  "${mod}+v" = "exec clipmenu -lines 12 -padding 18 -width 60 -location 0 -show drun -show-icons -sidebar-mode -columns 3 -matching fuzzy";
        #  "${mod}+d" = "exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -show-icons -sidebar-mode -columns 3 -matching fuzzy";
        #  "${mod}+c" = "kill";
        #  "${mod}+Shift+r" = "restart";
        };
        bars = [ 
	  {
	    command = "waybar";
	    fonts = [ "Fira Code:size=14" ];
	  }
	];
       };
     };
  };
}
