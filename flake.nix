{
  description = "Build environment for Teensy 4.0";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    teensy-core = import ./core.nix { inherit pkgs; };
    teensy-test = import ./test.nix { inherit pkgs teensy-core; };
  in {
    packages.${system} = {
      inherit teensy-core teensy-test;
    };
  };
}
