{ pkgs, teensy-core, ... }:

pkgs.stdenv.mkDerivation rec {
  name = "teensy-test";

  src = ./test;

  buildInputs = with pkgs; [
    gcc-arm-embedded
    teensy-core
  ];

  buildPhase = ''
    export CC=arm-none-eabi-gcc
    export CXX=arm-none-eabi-g++
    export OBJCOPY=arm-none-eabi-objcopy
    export SIZE=arm-none-eabi-size

    cp ${teensy-core}/include/Makefile.default Makefile
    export TEENSY_PATH=${teensy-core}
    make
  '';

  installPhase = ''
    mkdir $out
    cp *.hex $out/
  '';
}
