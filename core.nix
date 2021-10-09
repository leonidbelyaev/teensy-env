{ pkgs, ... }:

pkgs.stdenvNoCC.mkDerivation rec {
  name = "teensy-core";
  version = "1.54";

  src = pkgs.fetchFromGitHub {
    owner = "PaulStoffregen";
    repo = "cores";
    rev = "${version}";
    sha256 = "6IXKPVc06WCjJDOnDFOOqjPZSt4UhRW7LHyblEaZ7fw=";
  };

  buildInputs = with pkgs; [
    binutils
    gcc-arm-embedded
  ];

  buildPhase = ''
    export CC=arm-none-eabi-gcc
    export CXX=arm-none-eabi-g++

    pushd teensy4
    rm main.cpp
    cp ${./Makefile.lib} Makefile
    make
    ar rvs libteensy-core.a *.o
    popd
  '';

  installPhase = ''
    mkdir -p $out/{include,lib}
    pushd teensy4
    cp -r *.h $out/include/
    cp -r avr $out/include/
    cp -r debug $out/include/
    cp -r util $out/include/
    cp libteensy-core.a $out/lib/
    cp imxrt1062.ld $out/lib/
    popd
  '';
}
