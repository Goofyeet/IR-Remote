#include <IRremote.hpp>

int RECV_PIN = 7; // the pin where you connect the output pin of IR sensor 
bool EnableFeedback = true;
      
void setup()     
{     
Serial.begin(9600);
IrReceiver.begin(RECV_PIN, EnableFeedback);     
    
}

void loop()     
{     
  if (IrReceiver.decode()) {
      Serial.println(IrReceiver.decodedIRData.decodedRawData, HEX);
      IrReceiver.printIRResultShort(&Serial); // optional use new print version
      IrReceiver.printIRResultRawFormatted(&Serial, true);
      IrReceiver.resume(); // Enable receiving of the next value
}
}
