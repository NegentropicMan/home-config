# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
    fi

# A function for uploading text files to transfer.sh
transfer() {
  if [ $# -eq 0 ]; then
    echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
    return 1;
  fi

  tmpfile=$( mktemp -t transferXXX );

  if tty -s; then
    basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
  else
    curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile;
  fi;
cat $tmpfile;
echo
rm -f $tmpfile;
}

# Initialize the Nix environment
# This is needed if the login-shell is managed by Nix
if [ -e /home/pi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

