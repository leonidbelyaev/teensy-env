{ pkgs, ... }:

{
  spi = pkgs.fetchFromGitHub {
    owner = "PaulStoffregen";
    repo = "SPI";
    rev = "574ab8c7a8a45ea21cc56dcc6b7361da90868e86";
    sha256 = "I3M7w9SNEXvPD0ynuZ38bnTaenGEORg72E5YC2x6ek4=";
  };

  wire = pkgs.fetchFromGitHub {
    owner = "PaulStoffregen";
    repo = "Wire";
    rev = "15018075857fa0176d8a5fc610fc564427282ca0";
    sha256 = "GTfqmQykFS4nXXPBhQHe2gpEUY2sH0ESHh28ZrIW/dE=";
  };

  servo = pkgs.fetchFromGitHub {
    owner = "PaulStoffregen";
    repo = "Servo";
    rev = "0cf9712f15e1ab175f0ec06496bad1c23453fb64";
    sha256 = "k6QIWXJmPbLzd9gDmnrwWSA7kcUu7OcWfOwILVAYAbQ=";
  };

  lsm6ds = pkgs.fetchFromGitHub {
    owner = "adafruit";
    repo = "Adafruit_LSM6DS";
    rev = "f6ec7a1af1ba93beff41dfe0acf9f61d556e2d09";
    sha256 = "k6QIWXJmPbLzd9gDmnrwWSA7kcUu7OcWfOwILVAYAbQ=";
  };
}
