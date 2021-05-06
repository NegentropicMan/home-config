with import <nixpkgs> {};

{ config, pkgs, options, ... } :
let
  literate = stdenv.mkDerivation rec {
    # String interpolation to include the version number in the name
    # Including a version in the name is idiomatic
    pname = "literate";
    version = "git-2021-05-06";

    name = "literate";
    src = fetchFromGitHub {
      owner = "zyedidia";
      repo = "Literate";
      rev = "7004dffec0cff3068828514eca72172274fd3f7d";
      sha256 = "0x4xgrdskybaa7ssv81grmwyc1k167v3nwj320jvp5l59xxlbcvs";
      fetchSubmodules = true;
    };
    buildInputs = [ dub dmd ];

    installPhase = ''
      mkdir -p $out/bin
      cp ./bin/* $out/bin/
    '';
  };  
in
{
  home.packages = with pkgs; [ literate ];
}
