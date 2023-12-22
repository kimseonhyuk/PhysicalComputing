void serialEvent(Serial port){ 
   String inData = port.readStringUntil('\n');
   inData = trim(inData);

    if (inData.charAt(0) == 'S'){
    inData = inData.substring(1);
   }
   
   if (inData.charAt(0) == '0')
   {
     R = 0;
   }
    else 
    {
      R = 255;
    }
    inData = inData.substring(1);
    if (inData.charAt(0) == '0')
   {
     G = 0;
   }
    else 
    {
      G = 255;
    }
    inData = inData.substring(1);
    if (inData.charAt(0) == '0')
   {
     B = 0;
   }
    else 
    {
      B = 255;
    }
    inData = inData.substring(1);
    Sensor = int(inData);
}
