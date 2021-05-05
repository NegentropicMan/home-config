with import <nixpkgs> {};

{ config, pkgs, options, ... } :
let
  format-udf = stdenv.mkDerivation rec {
  # String interpolation to include the version number in the name
  # Including a version in the name is idiomatic
  pname = "literate";
  version = "git-2021-05-05";

  # fetchurl is a build support again; and does some funky stuff to support
  # selecting from a predefined set of mirrors
  src = fetchFromGitHub {
    owner = "zyedidia";
    repo = "literate";
    rev = "7004dffec0cff3068828514eca72172274fd3f7d";
    sha256 = "0iskwv05kbf2snk1ggh95mwn9q16r764n967cvfs4arp8cmmrhkk";
  };
  
  buildInputs = [ utillinux ];
  };
in
{
  home.packages = with pkgs; [ literate ];
}
