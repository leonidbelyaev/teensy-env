#include <Arduino.h>

extern "C" int main(void) {
  for (unsigned iPin=16; iPin <= 20; ++iPin) {
    pinMode(iPin, OUTPUT);
  }

  std::size_t i = 0;

  while (true) {
    digitalWrite(16, (i %  2) >  0);
    digitalWrite(17, (i %  4) >  1);
    digitalWrite(18, (i %  8) >  3);
    digitalWrite(19, (i % 16) >  7);
    digitalWrite(20, (i % 32) > 15);
    delay(analogRead(7));
    i++;
  }
}
