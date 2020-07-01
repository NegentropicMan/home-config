{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    fortune
    broot
    screen
    tmux
    byobu
    eweb
    asciidoctor
    imagemagick
  ];

  programs.fish.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      colorscheme PaperColor
    '';

    plugins = with pkgs.vimPlugins; [
      airline
      papercolor-theme
      vim-addon-nix
    ];
  };

  programs.git = {
    enable = true;
    userName = "NegentropicMan";
    userEmail = "florian.schmitz@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "a.sharetext" = "curl -F 'f:1=<-' ix.io";
      "a.weather" = "curl wttr.in/Nürnberg";
    
    };
    
    profileExtra = ''
transfer() {
  if [ $# -eq 0 ]; then
    echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
    return 1;
  fi
tmpfile=$( mktemp -t transferXXX );
if tty -s; then
  basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
  curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
else
  curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
fi; 
cat $tmpfile; 
echo
rm -f $tmpfile; 
}

if [ -e /home/pi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
  };
}
