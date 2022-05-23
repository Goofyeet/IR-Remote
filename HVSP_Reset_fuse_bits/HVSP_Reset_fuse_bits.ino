// High-voltaga serial programming instruction set (from ATtiny12 datasheet)
//
//  SDI = PB0
//  SII = PB1
//  SDO = PB2
//
//   Write Fuse Bits
//
//         Instr.1/5        Instr.2/6        Instr.3          Instr.4          Operation remark
//   SDI   0_0100_0000_00   0_CBA9_8543_00   0_0000_0000_00   0_0000_0000_00   Wait after Instr. 4 until SDO
//   SII   0_0100_1100_00   0_0010_1100_00   0_0110_0100_00   0_0110_1100_00   goes high. Write A - 3 = “0” to
//   SDO   x_xxxx_xxxx_xx   x_xxxx_xxxx_xx   x_xxxx_xxxx_xx   x_xxxx_xxxx_xx   program the Fuse bit.
//
//  To Reset fuse bits (default value)
//
//    0_CBA9_8543_00 = 0_0101_0010_00
//
//

#include <Arduino.h>


// ATtiny12 pin mapping at Arduino uno programmer
#define SDI_PIN 9     // serial data input
#define SII_PIN 10    // serial instruction input
#define SDO_PIN 11    // serial data output
#define SCI_PIN 12    // serial clock input
#define RESET_PIN 13  // reset


void avr_hvsp_write(uint8_t sdi, uint8_t sii)
{
   digitalWrite(SDI_PIN, LOW);
   digitalWrite(SII_PIN, LOW);
   digitalWrite(SCI_PIN, HIGH);
   digitalWrite(SCI_PIN, LOW);

   for (uint8_t i = 0; i < 8; i++)
   {
      digitalWrite(SDI_PIN, (sdi & (1 << (7-i))));
      digitalWrite(SII_PIN, (sii & (1 << (7-i))));
      digitalWrite(SCI_PIN, HIGH);
      digitalWrite(SCI_PIN, LOW);
   }

   digitalWrite(SDI_PIN, LOW);
   digitalWrite(SII_PIN, LOW);
   digitalWrite(SCI_PIN, HIGH);
   digitalWrite(SCI_PIN, LOW);
   digitalWrite(SCI_PIN, HIGH);
   digitalWrite(SCI_PIN, LOW);
}

void avr_hvsp_write_fuse(uint8_t fuse)
{
   avr_hvsp_write(0b01000000, 0b01001100);
   avr_hvsp_write(fuse,       0b00101100);
   avr_hvsp_write(0b00000000, 0b01100100);
   avr_hvsp_write(0b00000000, 0b01101100);
   while (digitalRead(SDO_PIN) == LOW) { };
}


void setup()
{
   Serial.begin(9600);

   // setup pin modes
   pinMode(SDI_PIN, OUTPUT);
   pinMode(SII_PIN, OUTPUT);
   pinMode(SDO_PIN, OUTPUT);
   pinMode(SCI_PIN, OUTPUT);
   pinMode(RESET_PIN, OUTPUT);

   // enter programming mode
   digitalWrite(SDI_PIN, LOW);    //Set PB0 Low
   digitalWrite(SII_PIN, LOW);    //set PB1 Low
   digitalWrite(SDO_PIN, LOW);    //set PB2 Low
   digitalWrite(RESET_PIN, HIGH); // pull attiny12 reset pin to ground

   //toggle PB3/SCI 4 times
   for (uint8_t i = 0; i < 4; i++)
   {
       digitalWrite(SCI_PIN, HIGH);
       digitalWrite(SCI_PIN, LOW);
   }
   
   delayMicroseconds(20);
   digitalWrite(RESET_PIN, LOW);  // attiny12 reset pin to 12V
   delayMicroseconds(10);
   pinMode(SDO_PIN, INPUT);
   delayMicroseconds(300);

   // write default fuse values
   avr_hvsp_write_fuse(0x52);

   // exit programming mode
   //digitalWrite(RESET_PIN, HIGH);  // pull attiny12 reset pin to ground (arduino uno LED will be on)
}


void loop()
{
   Serial.print("Programming done");
   while (true)
   {
      delay(1000);
      Serial.print(".");
   }
}
