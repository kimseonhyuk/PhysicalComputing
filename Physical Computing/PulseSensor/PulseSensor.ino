int pulsePin = 0;
int Rbutton = 8;
int Gbutton = 10;
int Bbutton = 12;

bool Rpressed = false;
bool Rgate = true;

bool Gpressed = false;
bool Ggate = true;

bool Bpressed = false;
bool Bgate = true;



volatile int BPM;
volatile int Signal;
volatile int IBI = 600;
volatile boolean Pulse = false;
volatile boolean QS = false;


void setup(){
  pinMode(Rbutton, INPUT);
  pinMode(Gbutton, INPUT);
  pinMode(Bbutton, INPUT);

  Serial.begin(9600);
  interruptSetup();
}



void loop(){

        sendDataToProcessing('S', Signal);
        delay(20);   

  if (digitalRead(Rbutton) == HIGH)
  {
    if (Rgate)
    {
      Rpressed = true;
      Rgate = false;
    }
    else
    {
      Rpressed = false;
      Rgate = true;
    }
  }

  if (digitalRead(Gbutton) == HIGH)
  {
    if (Ggate)
    {
      Gpressed = true;
      Ggate = false;
    }
    else
    {
      Gpressed = false;
      Ggate = true;
    }
  }

  if (digitalRead(Bbutton) == HIGH)
  {
    if (Bgate)
    {
      Bpressed = true;
      Bgate = false;
    }
    else
    {
      Bpressed = false;
      Bgate = true;
    }
  }
}


void sendDataToProcessing(char symbol, int data ){
    Serial.print(symbol);
    data = map(data,200,900,0,10);
    data = constrain(data,0,10);
    Serial.print(Rpressed);
    Serial.print(Gpressed);
    Serial.print(Bpressed);
    Serial.println(data);
  }