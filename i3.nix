{config, lib, pkgs, ...}:

let
  mod = "Mod4";
in {
  home.packages = with pkgs; [
    dmenu
  ];
  xsession = {
     enable = true;
     windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;
        fonts = ["DejaVu Sans Mono, FontAwesome 6"];
      };
    };
  };
}
