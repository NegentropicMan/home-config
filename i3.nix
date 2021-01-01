{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  focus = "#D75F00";
  unfocus = "#EEEEEE";
  dotfileDir = ./dotfiles;

  rofi-script-to-dmenu = pkgs.stdenv.mkDerivation rec {
    pname = "rofi-script-to-dmenu";
    version = "1.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "jluttine";
      repo = pname;
      rev = version;
      sha256 = "0fgyc5kaw1784lqdfj1w995imh2c5x7fvvmh4ll120963zc78pg6";
    };
    buildPhase = "";
    installPhase = ''
      install -Dm755 rofi-script-to-dmenu $out/bin/rofi-script-to-dmenu
    '';
  };

  rofi-power-menu = pkgs.stdenv.mkDerivation rec {
    pname = "rofi-power-menu";
    version = "3.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "jluttine";
      repo = pname;
      rev = version;
      sha256 = "1kab1wabm5h73rj5p3114frjb7f1iqli89kfddrhp8z0n8348jw9";
    };
    buildPhase = "";
    installPhase = ''
      install -Dm755 rofi-power-menu $out/bin/rofi-power-menu
      install -Dm755 dmenu-power-menu $out/bin/dmenu-power-menu
    '';
  };

in {
  imports = [
  ];
  home.packages = with pkgs; [
    clipmenu
    rofi-power-menu
    rofi-script-to-dmenu 
    libnotify
    dex
    alacritty
    hsetroot
    sxiv
    mupdf
    luakit
    arandr
    networkmanagerapplet
    dmenu
    (st.overrideAttrs (oldAttrs: rec {
      # ligatures dependency
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
       # ligatures patch
       (fetchpatch {
         url = "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
         sha256 = "18fllssg5d5gik1x0ppz232vdphr0y2j5z8lhs5j9zjs8m9ria5w";
       })
      ];
      # Use a local configuration header
      configFile = writeText "config.def.h" (builtins.readFile ./config.def.h);
      postPatch = oldAttrs.postPatch + ''cp ${configFile} config.def.h'';
    }))
    feh
    picom
    (rofi.override {
      plugins = [ rofi-file-browser rofi-power-menu ];
    })
  ];

  programs.autorandr.enable = true;
  services.dunst = {
    enable = true;
    settings = {
      global = {
	follow = "mouse";
	geometry = "0x5-30+20";
	indicate_hidden = "yes";
	frame_color = "#aaaaaa";
	separator_color = "auto";
	font = "Fira Code 12";
	startup_notification = true;
	format = "<b>%s</b>\n%b";
      };
      urgency_low = {
	background = "#EEEEEE";
	foreground = "#BCBCBC";
      };
      urgency_normal = {
	background = "#EEEEEE";
	foreground = "#878787";
      };
      urgency_critical = {
	background = "#EEEEEE";
	foreground = "#D70000";
      };
    };
  };
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };

  programs.i3status = {
    enable = true;
    enableDefault = true;

  };

  home.sessionVariables = {
    BROWSER = "firefox";
    CM_LAUNCHER = "rofi";
  };
  
  xsession = {
     enable = true;
     windowManager.i3 = {
       enable = true;
       package = pkgs.i3-gaps;
       config = {
	modifier = mod;
        #fonts = ["DejaVu Sans Mono, FontAwesome 6"];
        fonts = ["Fira Code 12"];
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
        startup = [
          {command = "feh --bg-scale ~/.wallpaper.jpg"; notification = false;}
          {command = "xsettingsd"; notification = false;}
          {command = "autorandr --change"; notification = false; always = true;}
          {command = "clipmenud"; notification = false;}
          {command = "picom -bcCGf -i 0.7 -e 0.9"; notification = false;}
          #{command = "dunst"; notification = false;}
        ];
        keybindings = lib.mkOptionDefault {
          "${mod}+Return" = "exec st -f 'FiraCode:size=12:autohint=true:antialias=true' -e tmux"; # FantasqueSansMono
          "${mod}+v" = "exec clipmenu -lines 12 -padding 18 -width 60 -location 0 -show drun -show-icons -sidebar-mode -columns 3 -matching fuzzy";
          "${mod}+d" = "exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -show-icons -sidebar-mode -columns 3 -matching fuzzy";
          "${mod}+c" = "kill";
          "${mod}+Shift+r" = "restart";
          "${mod}+Home" = "exec xdg-open $HOME";
          "${mod}+q" = "exec i3-nagbar -f 'xft:FiraCode 12' -t warning -m 'Really, exit?' -b 'Yes' 'i3-msg exit'";
	  "${mod}+h" = "focus left";
	  "${mod}+j" = "focus down";
	  "${mod}+k" = "focus up";
	  "${mod}+l" = "focus right";
	  "${mod}+Shift+h" = "move left";
	  "${mod}+Shift+j" = "move down";
	  "${mod}+Shift+k" = "move up";
	  "${mod}+Shift+l" = "move right";
        };
        bars = [ {fonts = ["FiraCode 12"]; statusCommand = "i3status";} ];
       };
     };
  };
  
  xresources.properties = {
    "Xft.autohint" = 0;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintstyle" = "hintslight";
    "Xft.hinting" = 1;
    "Xft.antialias" = 1;
    "Xft.rgba" = "rgb";
    "*font" = "xft:Fira Code 12";
    "*alpha" = "0.9";
    "antialias" = true;
    "autohint" = true;
    "*.cursorColor" = "#25c3dc";
    "*.pointerColor" = "#25c3dc";
    "*.foreground" = "#f2f2f2";
    "*.background" = "#1C1C1C";
    "*.color0" = "#2c2c2c";
    "*.color8" = "#969694";
    "*.color1" = "#D7005F";
    "*.color9" = "#D7005F";
    "*.color2" = "#718C00";
    "*.color10" = "#718C00";
    "*.color3" = "#D75F00";
    "*.color11" = "#D75F00";
    "*.color4" = "#4271AE";
    "*.color12" = "#4271AE";
    "*.color5" = "#8959A8";
    "*.color13" = "#8959A8";
    "*.color6" = "#3E999F";
    "*.color14" = "#3E999F";
    "*.color7" = "#4D4D4C";
    "*.color15" = "#F5F5F5";
  };
}
