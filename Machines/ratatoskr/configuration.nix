# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  TEST = 0;
in 
{
  nixpkgs.config.allowUnfree = true;

  imports = [ # Include the results of the hardware scan.
      <nixos-hardware/lenovo/thinkpad>
      <nixos-hardware/common/pc/ssd>
      <nixos-hardware/lenovo/thinkpad/tp-smapi.nix>
      ./hardware-configuration.nix
    ];
  
  # Use the tp_smapi module for battery control
  # @@@todo: Find out how to use only this one, not the other one
  # boot.extraModulePackages = with config.boot.kernelPackages; [ tp_smapi ];
  services.tlp.settings = {
    TPACIP_ENABLE = 0;
    NATACPI_ENABLE = 0;
    TPSMAPI_ENABLE = 1;
    START_CHARGE_THRESH_BAT0 = 40;
    STOP_CHARGE_THRESH_BAT0 = 80;
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "alberich"; # Define your hostname.
  networking.networkmanager.enable = true;

  zramSwap.enable = true;

  time.timeZone = "Europe/Berlin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Keep the system upgraded
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  # Clean the system periodically
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  
  fonts.fonts = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ]; 

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono NF" ];
    sansSerif = [ "Noto Sans" ];
    serif = [ "Noto Serif" ];
  };
  
  programs.light.enable = true;
  programs.dconf.enable = true;
  programs.fish.enable = true;
  hardware.acpilight.enable = true;

  # Keybindings for adjusting monitor brightness. Adjusting brightness with
  # actkbd+light is nice because it's independent of X and works in ttys.
  services.actkbd = {
    enable = true;
    bindings = let
      light = "${pkgs.light}/bin/light";
      step = "10";
    in [
      {
        keys = [ 224 ];
        events = [ "key" ];
        # Use minimum brightness 0.1 so the display won't go totally black.
        command = "${light} -N 0.1 && ${light} -U ${step}";
      }
      {
        keys = [ 225 ];
        events = [ "key" ];
        command = "${light} -A ${step}";
      }
      {
        keys = [ 113 ]; # Mute
        events = [ "key" ];
        command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      }
      {
        keys = [ 114 ]; # VolDn
        events = [ "key" ];
        command = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
      }
      {
        keys = [ 115 ]; # VolUp
        events = [ "key" ];
        command = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
      }
    ];
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  #i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # hardware.opengl.driSupport32Bit = true;
  hardware.opengl.driSupport = true;
  
  programs.sway.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1"; # Needed by mpd to be able to use Pulseaudio
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fschmitz = {
    isNormalUser = true;
    description = "Florian Schmitz";
    extraGroups = [ "wheel" "networkmanager" "video" "dialout"]; # "dialout" is a workaround for arduino programming
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ly wget vim gitAndTools.gitFull modemmanager home-manager ntfs3g
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.mosh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
#
