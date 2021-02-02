with import <nixpkgs> {};
{ stdenv }:
stdenv.mkDerivation rec {
  # String interpolation to include the version number in the name
  # Including a version in the name is idiomatic
  pname = "format-udf";
  version = "git-2021-02-01";

  # fetchurl is a build support again; and does some funky stuff to support
  # selecting from a predefined set of mirrors
  src = fetchFromGitHub {
    owner = "JElchison";
    repo = "format-udf";
    rev = "5d97a97ac91cc2da7bc68a9dc737fdfe2feae606";
    sha256 = "0ki3d8k4pa3wimn2027qi1pp763m4q2icx6fy5dqn2jf7c8whl1s";
  };
  
  buildInputs = [ libblockdev udftools utillinux ];

  installPhase = ''
    # Make the output directory
    mkdir -p $out/bin

    # Copy the script and make it executable
    cp format-udf.sh $out/bin
    chmod +x $out/bin/format-udf.sh
  '';
}
