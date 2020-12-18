{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  focus = "#AA0605";
  unfocus = "#F0EDEC";
in {
  home.packages = with pkgs; [
    dmenu
    st
    feh
    picom
    rofi
  ];
  
  home.sessionVariables = {
    TERMINAL = "st -f FiraCode Nerd Font:pixelsize=12";
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
              bg = focus;
              text = focus;
              indicator = focus;
            };
            focusedInactive = {
              border = unfocus;
              bg = unfocus;
              text = unfocus;
              indicator = unfocus;
            };
            unfocused = {
              border = unfocus;
              bg = unfocus;
              text = unfocus;
              indicator = unfocus;
            };
            urgent = {
              border = focus;
              bg = focus;
              text = focus;
              indicator = focus;
            };
            background = unfocus;
        }; # colors end
        
        floating.modifier = mod;
        
        gaps.inner = 3;
        gaps.smartGaps = "on";
        gaps.smartBorders = "on";
        startup = [
          {command = "feh --bg-scale ~/.wallpaper.jpg"; notification = false}
          {command = "xsettingsd";notification = false}
          {command = "picom  -bcCGf -i 0.7 -e 0.9"; notification = false}
        ];
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
    "*.pointerColor" = #25c3dc";
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
