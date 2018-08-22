//E','S','K','I','S','T','L','F','Ü','N','F','','','','==>','ES','IST','FÜNF
//Z','E','H','N','Z','W','A','N','Z','I','G','','','','==>','ZEHN','ZWANZIG
//D','R','E','I','V','I','E','R','T','E','L','','','','==>','DREI|VIERTEL
//T','G','N','A','C','H','V','O','R','J','M','','','','==>','NACH','VOR
//H','A','L','B','Q','Z','W','Ö','L','F','P','','','','==>','HALB','ZWÖLF
//Z','W','E','I','N','S','I','E','B','E','N','','','','==>','ZW|EI|N|S|IEBEN
//K','D','R','E','I','R','H','F','Ü','N','F','','','','==>','DREI','FÜNF
//E','L','F','N','E','U','N','V','I','E','R','','','','==>','ELF','NEUN','VIER
//W','A','C','H','T','Z','E','H','N','R','S','','','','==>','ACHT','ZEHN
//B','S','E','C','H','S','F','M','U','H','R','','','','==>','SECHS','UHR

char[] chars = new char[]{
  'E', 'S', 'K', 'I', 'S', 'T', 'L', 'F', 'Ü', 'N', 'F', 
  'Z', 'E', 'H', 'N', 'Z', 'W', 'A', 'N', 'Z', 'I', 'G', 
  'D', 'R', 'E', 'I', 'V', 'I', 'E', 'R', 'T', 'E', 'L', 
  'T', 'G', 'N', 'A', 'C', 'H', 'V', 'O', 'R', 'J', 'M', 
  'H', 'A', 'L', 'B', 'Q', 'Z', 'W', 'Ö', 'L', 'F', 'P', 
  'Z', 'W', 'E', 'I', 'N', 'S', 'I', 'E', 'B', 'E', 'N', 
  'K', 'D', 'R', 'E', 'I', 'R', 'H', 'F', 'Ü', 'N', 'F', 
  'E', 'L', 'F', 'N', 'E', 'U', 'N', 'V', 'I', 'E', 'R', 
  'W', 'A', 'C', 'H', 'T', 'Z', 'E', 'H', 'N', 'R', 'S', 
  'B', 'S', 'E', 'C', 'H', 'S', 'F', 'M', 'U', 'H', 'R'
};

void setup() {
  size(500, 500);
}

int time = 0;
int oldSecond = 0;

void draw() {
  background(0);
  textSize(18);
  for (int i=0; i<10; i++) {
    for (int j=0; j<11; j++) {
      text(chars[i*11+j], j*40+40, i*40+40);
    }
  }
  
  int h = (time / 3600) % 24;
  int m = (time / 60) % 60;
  println ("TIME: " + time + "; H: "+h + "; M: " +m);
  text(generateTimeString(h, m), 40, 450);
  
  if (oldSecond != second()){  
    time += 2*60;
    oldSecond = second();
  }
}

String generateTimeString(int h, int m) {
  String dezTime = h+ ":" + m;
  println(dezTime);
  String newTime = "";

  int min = m;
  if (min > 58 || min<=3)  
  {
    newTime = "ES IST";
  } else
    if (min >3 && min <=8) 
    {
      newTime = "ES IST FÜNF NACH";
    } else  
    if (min>8 && min <=13)
    {
      newTime ="ES IST ZEHN NACH";
    } else 
    if (min>13 && min <=18)
    {
      newTime ="ES IST VIERTEL NACH";
    } else
      if (min>18 && min <=23)
      {
        newTime ="ES IST ZWANZIG NACH";
      } else
        if (min>23 && min <=28)
        {
          newTime="ES IST FÜNF VOR HALB";
        } else
          if (min>28 && min <=33)
          {
            newTime ="ES IST HALB";
          } else
            if (min>33 && min <=38)
            {
              newTime ="ES IST FÜNF NACH HALB";
            } else
              if (min>38 && min <=43)
              {
                newTime ="ES IST ZWANZIG VOR";
              } else
                if (min>43 && min <=48)
                {
                  newTime ="ES IST VIERTEL VOR";
                } else
                  if (min>48 && min <=53)
                  {
                    newTime = "ES IST ZEHN VOR";
                  } else
                    if (min>53 && min <=58)
                    {
                      newTime ="ES IST FÜNF VOR";
                    }
  
  if(min < 23) {
    newTime += " " + getFullHourString(h,m); 
  } else {
    newTime += " " + getFullHourString(h+1,m);
  }
  
  if(min >58 || min < 3) {
    newTime += " UHR";
  }

  return newTime;
}

String getFullHourString(int hour, int min){
  int twelfeHour = hour % 12;
  
  switch(twelfeHour){
    case 0: return "ZWÖLF";
    case 1: return min>58?"EIN":min<3?"EIN":"EINS";
    case 2: return "ZWEI";
    case 3: return "DREI";
    case 4: return "VIER";
    case 5: return "FÜNF";
    case 6: return "SECHS";
    case 7: return "SIEBEN";
    case 8: return "ACHT";
    case 9: return "NEUN";
    case 10: return "ZEHN";
    case 11: return "ELF";
    case 12: return "ZWÖLF";
  }
  return "";
}