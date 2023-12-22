import processing.serial.*;

Serial port; 
Curveline[]curvelines = new Curveline[1];

int Sensor;
int R = 0;
int G = 0;
int B = 0;

void setup(){
  
  size(600,600);
  smooth();
  background(255);
  
  port = new Serial(this, Serial.list()[1], 9600);
  port.clear();
  port.bufferUntil('\n');
  
  for(int i=0; i<curvelines.length;i++){
   curvelines[i]= new Curveline();
  }
}


void draw(){

   noStroke();
   for(int i=0; i<curvelines.length;i++){
     curvelines[i].rotation();
     curvelines[i].deco();
     curvelines[i].display(Sensor);
   }
   println(Sensor);
}
  
  
class Curveline{
  
  float endx;
  float endy;
  float theta = 0; 
  float r = 0;
  float op;
  float sw;
  float time =60;
  float increment = 0.2;

  Curveline(){
   
  }
  
  
  void rotation(){
    
    endx = cos(theta) * r;
    endy = sin(theta) * r; 
    
    theta+=0.01;
    r+=0.02;
  }
  

  
  void deco(){
       
    sw = noise(time)*0.4;
    op = noise(time)*70;
    increment+=0.2;
    time+=increment;
  }
    
    
  void display(int pScale){
  fill(R,G,B,op);
  ellipse(width/2+endx,height/2+endy,pScale,pScale);
  ellipse(width/2-endx,height/2-endy,pScale,pScale);
  }
  
}
    
  
