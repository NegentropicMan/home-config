{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  focus = "#AA0605";
  unfocus = "#F0EDEC";

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
    rofi-power-menu
    rofi-script-to-dmenu 
    dunst
    libnotify
    dex
    alacritty
    hsetroot
    autorandr
    sxiv
    mupdf
    luakit
    arandr
    udiskie
    networkmanagerapplet
    dmenu
    st
    feh
    picom
    (rofi.override {
      plugins = [ rofi-file-browser ];
    })
    (polybar.override {
      i3Support = true;
      pulseSupport = true;
      nlSupport = false;
      iwSupport = true;
      wirelesstools = wirelesstools;
      #githubSupport = true;
      #mpdSupport = true;
    })
  ];

  home.sessionVariables = {
    browser = "firefox";
  };

  xsession = {
     enable = true;
     windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;
        #fonts = ["DejaVu Sans Mono, FontAwesome 6"];
        fonts = ["FiraCode 12"];
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
          {command = "xsettingsd";notification = false;}
          {command = "picom  -bcCGf -i 0.7 -e 0.9"; notification = false;}
        ];
        keybindings = lib.mkOptionDefault {
          "${mod}+Return" = "exec st -f 'FiraCode:size=14:autohint=true:antialias=true'"; # FantasqueSansMono
          "${mod}+d" = "exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -matching fuzzy";
          "${mod}+c" = "kill";
          "${mod}+Shift+r" = "restart";
          "${mod}+q" = ''i3-nagbar -t warning -m "Really, exit?" -b "Yes" "i3-msg exit"'';
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
    "*font" = "xft:Fira Code 14";
    "*alpha" = "0.9";
    "antialias" = true;
    "autohint" = true;
    "*.cursorColor" = "#25c3dc";
    "*.pointerColor" = "#25c3dc";
    "*.foreground" = "#f2f2f2";
    "*.background" = "#1C1C1C";
    "*.color0" = "#2c2c2c";
    "*.color8" = "#969694";
    "*.color1" = "#c62828";
    "*.color9" = "#f15250";
    "*.color2" = "#558b2ek";
    "*.color10" = "#86bd47";
    "*.color3" = "#f9a825";
    "*.color11" = "#f8e63a";
    "*.color4" = "#1565c1";
    "*.color12" = "#77b2f6";
    "*.color5" = "#6a1e9a";
    "*.color13" = "#b963c8";
    "*.color6" = "#00838f";
    "*.color14" = "#25c3dc";
    "*.color7" = "#ffffff";
    "*.color15" = "#ffffff";
  };
}
