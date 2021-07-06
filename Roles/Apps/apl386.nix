with import <nixpkgs> {};

{ config, pkgs, options, ... } :
let
  apl386 = stdenv.mkDerivation rec {
    # String interpolation to include the version number in the name
    # Including a version in the name is idiomatic
    pname = "APL386";
    version = "git-2021-06-12";

    name = "APL386";
    src = fetchFromGitHub {
      owner = "abrudz";
      repo = "APL386";
      rev = "c8894cf978ca4d47889f1e3f4449a6efb2caaf40";
      sha256 = "07f7gxrn83ydqszmh0zdn9kl8mxd2xskz9dp97z9fz0vjqzv22r0";
    };
    buildInputs = [ ];
    installPhase = "install -D $src/APL386.ttf $out/share/fonts/truetype/APL386.ttf";
  };  
in
{
  home.packages = with pkgs; [ apl386 ];
}
