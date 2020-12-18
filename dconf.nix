# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/control-center" = {
      "last-panel" = "color";
    };

    "org/gnome/desktop/input-sources" = {
      "current" = "uint32 0";
      "sources" = [ (mkTuple [ "xkb" "de" ]) ];
      "xkb-options" = [ "nodeadkeys" "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/interface" = {
      "clock-show-weekday" = true;
      "gtk-im-module" = "gtk-im-context-simple";
      "show-battery-percentage" = true;
    };

    "org/gnome/desktop/notifications" = {
      "application-children" = [ "gnome-power-panel" ];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      "application-id" = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      "left-handed" = true;
      "speed" = -0.6691176470588236;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      "two-finger-scrolling-enabled" = true;
    };

    "org/gnome/desktop/privacy" = {
      "report-technical-problems" = true;
    };

    "org/gnome/desktop/session" = {
      "idle-delay" = "uint32 900";
    };

    "org/gnome/evolution-data-server" = {
      "migrated" = true;
      "network-monitor-gio-name" = "";
    };

    "org/gnome/gedit/plugins" = {
      "active-plugins" = [ "modelines" "spell" "time" "filebrowser" "docinfo" ];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      "root" = "file:///";
      "tree-view" = true;
      "virtual-root" = "file:///home/fschmitz/.config/nixpkgs";
    };

    "org/gnome/gedit/preferences/ui" = {
      "show-tabs-mode" = "auto";
    };

    "org/gnome/gedit/state/window" = {
      "bottom-panel-size" = 140;
      "side-panel-active-page" = "GeditWindowDocumentsPanel";
      "side-panel-size" = 200;
      "size" = mkTuple [ 900 700 ];
      "state" = 87168;
    };

    "org/gnome/mutter" = {
      "attach-modal-dialogs" = true;
      "dynamic-workspaces" = true;
      "edge-tiling" = true;
      "focus-change-on-pointer-rest" = true;
      "workspaces-only-on-primary" = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      "idle-dim" = true;
      "power-button-action" = "interactive";
      "sleep-inactive-ac-type" = "nothing";
    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      "antialiasing" = "rgba";
      "hinting" = "slight";
    };

    "org/gnome/shell" = {
      "enabled-extensions" = "@as []";
    };

    "org/gnome/shell/world-clocks" = {
      "locations" = "@av []";
    };

    "org/gnome/system/location" = {
      "enabled" = false;
    };

  };
}
