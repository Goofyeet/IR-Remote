#include <IRremote.hpp>

bool EnableFeedback = true;
int Send_PIN = 9; // the pin where you connect the output pin of IR LED 
int low_num;
int low_pin = 5;
int input_pins[5] = {2,3,4,5,6};

void preamble(){
    IrSender.sendPulseDistanceWidthData( 9000, 4500, 600, 550, 0x1, 1, false, false);
    IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xfe01, 16, false, false);
}

void setup() {
  pinMode(Send_PIN, OUTPUT);
  
//pushbutton inputs to control fan  
for(int i = 0; i < 5; i++){
    pinMode(input_pins[i], INPUT_PULLUP);
}
  
Serial.begin(9600);
IrSender.begin(Send_PIN, EnableFeedback); 

}

void loop() 
{
low_num = 0;
low_pin = 5;

for(int j = 0; j < 5; j++){
  if (!digitalRead(input_pins[j])){
    low_num++;
    low_pin = j;
    if (low_num > 1){
      break;          //breaks out of for loop if more than one button is pressed at the same time
    }
  }
  if ((j == 4) && (low_pin < 5)){
    preamble();
    switch(low_pin){
      case 0:
        IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xfc03fc03, 32, false, true); // power code
        break;
      case 1:
        IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xf807f807, 32, false, true); // speed code
        break;
      case 2:
        IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xec13ec13, 32, false, true); // rotation code
        break;
      case 3:
        IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xf40bf40b, 32, false, true); // timer code
        break;
      case 4:
        IrSender.sendPulseDistanceWidthData( 600, 1650, 600, 550, 0xf00ff00f, 32, false, true); // mode code
        break;
        
   }
   delay(100);
  }
 }
}
