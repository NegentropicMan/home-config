# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/Geary" = {
      "folder-list-pane-position-horizontal" = 100;
      "messages-pane-position" = 351;
      "migrated-config" = true;
    };

    "org/gnome/control-center" = {
      "last-panel" = "user-accounts";
    };

    "org/gnome/desktop/background" = {
      "color-shading-type" = "solid";
      "picture-options" = "zoom";
      "picture-uri" = "file:///home/fschmitz/.local/share/backgrounds/2020-12-20-21-24-34-microcircuit_circuit_bw_126894_4752x3168.jpg";
      "primary-color" = "#000000000000";
      "secondary-color" = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      "current" = "uint32 0";
      "sources" = [ (mkTuple [ "xkb" "de" ]) ];
      "xkb-options" = [ "nodeadkeys" "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/interface" = {
      "clock-show-weekday" = true;
      "gtk-im-module" = "gtk-im-context-simple";
      "gtk-theme" = "Adwaita-dark";
      "icon-theme" = "Adwaita";
      "show-battery-percentage" = true;
    };

    "org/gnome/desktop/notifications" = {
      "application-children" = [ "gnome-power-panel" "firefox" ];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      "application-id" = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      "application-id" = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      "left-handed" = true;
      "speed" = -0.669118;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      "two-finger-scrolling-enabled" = true;
    };

    "org/gnome/desktop/privacy" = {
      "report-technical-problems" = true;
    };

    "org/gnome/desktop/screensaver" = {
      "color-shading-type" = "solid";
      "picture-options" = "zoom";
      "picture-uri" = "file:///home/fschmitz/.local/share/backgrounds/2020-12-20-21-24-34-microcircuit_circuit_bw_126894_4752x3168.jpg";
      "primary-color" = "#000000000000";
      "secondary-color" = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      "idle-delay" = "uint32 900";
    };

    "org/gnome/desktop/sound" = {
      "event-sounds" = true;
      "theme-name" = "__custom";
    };

    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = "appmenu:maximize,close";
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

    "org/gnome/nautilus/preferences" = {
      "default-folder-viewer" = "icon-view";
      "search-filter-time-type" = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      "initial-size" = mkTuple [ 890 550 ];
      "maximized" = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      "night-light-enabled" = true;
      "night-light-temperature" = "uint32 3169";
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
      "enabled-extensions" = [ "dash-to-dock@micxgx.gmail.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      "apply-custom-theme" = false;
      "custom-theme-shrink" = false;
      "dock-position" = "BOTTOM";
      "extend-height" = false;
      "force-straight-corner" = false;
      "running-indicator-style" = "DEFAULT";
      "show-favorites" = false;
      "show-show-apps-button" = true;
      "show-trash" = false;
      "show-windows-preview" = true;
    };

    "org/gnome/shell/world-clocks" = {
      "locations" = "@av []";
    };

    "org/gnome/system/location" = {
      "enabled" = false;
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      "background-color" = "rgb(238,238,236)";
      "bold-is-bright" = false;
      "cursor-shape" = "block";
      "font" = "Fira Code Medium 12";
      "foreground-color" = "rgb(46,52,54)";
      "palette" = [ "rgb(0,0,0)" "rgb(205,0,0)" "rgb(0,205,0)" "rgb(205,205,0)" "rgb(0,0,205)" "rgb(205,0,205)" "rgb(0,205,205)" "rgb(250,235,215)" "rgb(64,64,64)" "rgb(255,0,0)" "rgb(0,255,0)" "rgb(255,255,0)" "rgb(0,0,255)" "rgb(255,0,255)" "rgb(0,255,255)" "rgb(255,255,255)" ];
      "use-system-font" = false;
      "use-theme-colors" = true;
    };

    "org/gtk/settings/file-chooser" = {
      "date-format" = "regular";
      "location-mode" = "path-bar";
      "show-hidden" = true;
      "show-size-column" = true;
      "show-type-column" = true;
      "sidebar-width" = 158;
      "sort-column" = "name";
      "sort-directories-first" = false;
      "sort-order" = "ascending";
      "type-format" = "category";
      "window-position" = mkTuple [ 26 23 ];
      "window-size" = mkTuple [ 1369 902 ];
    };

  };
}
