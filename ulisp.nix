{ pkgs, ... }:

# hacky usage of arduino-cli to preprocess ulisp "ino" source into compilable C++ code
pkgs.stdenv.mkDerivation rec {
  name = "ulisp-arm.cpp";

  src = pkgs.fetchFromGitHub {
    owner = "technoblogy";
    repo = "ulisp-arm";
    rev = "a25fff3ef1072bdc2733d8064fcf0738579ab7ed";
    sha256 = "p6H9To9vccHrP46Cv5m+cAFDVPXDCORUWcqOz18c3kg=";
  };

  outputHashMode = "flat";
  outputHashAlgo = "sha256";
  outputHash = "mutVLBFSpTXgUzu594zZ3akR/Z7e9n5SytU6WoQ6rKA=";

  buildInputs = with pkgs; [
    cacert
    arduino-cli
  ];

  buildPhase = ''
    export HOME=/tmp/arduino
    arduino-cli core install arduino:samd
    mv ulisp-arm.ino source.ino
    arduino-cli compile --fqbn arduino:samd:arduino_zero_native --preprocess > ulisp-arm.cpp
    echo 'extern "C" int main(void) { setup(); while(true) { loop(); } }' >> ulisp-arm.cpp
  '';

  installPhase = ''
    cp ulisp-arm.cpp $out
  '';
}
