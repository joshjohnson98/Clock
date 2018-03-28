class Clock{
  //Lengths of hands
  private float sRad = 162;
  private float mRad = 137;
  private float hRad = 120;
  
  private String hr;
  private String min;
  private String sec;
  private String end;
  
  private int hourOffset;
  private int dotSize;
    
  //use second(),minute(), and hour() functions for current time
  
  public void displayClock(){
    translate(width/2, height/2);
    //draw the traditional clock w/ 3 hands (hr, min, sec) using
    //shapes, characters w/ proper color and font
    //Display the clock w/ current time
    background(80,70,240);
    
    //clock base
    ellipse(0,0,400,400);
    
    //dots
    displayDots();
    
    //numbers
    displayNumbers();
    
    //second hand
    stroke(255,0,100);
    strokeWeight(2);
    line(0,0,sRad*cos(2*PI*second()/60-PI/2),sRad*sin(2*PI*second()/60-PI/2));
    
    //minute hand
    stroke(50,50,200);
    strokeWeight(3);
    line(0,0,mRad*cos(2*PI*minute()/60-PI/2),mRad*sin(2*PI*minute()/60-PI/2));
    
    //hour hand
    stroke(0);
    strokeWeight(4);
    line(0,0,hRad*cos(2*PI*hour()/12-PI/2),hRad*sin(2*PI*hour()/12-PI/2));
    
    //Digital*******
    fill(255);
    
    //account for 24-hr time
    if (hour()>12){
      hourOffset = -12;
      end = "PM";
    }
    else{
      hourOffset = 0;
      end = "AM";
    }
    
    hr = str(hour()+hourOffset);
    min = str(minute());
    sec = str(second());
    textSize(30);
    
    if (minute()<10 && second()<10){
      text(hr + ":0" + min + ":0" + sec + " " + end, 0, -230);
    }
    else if (minute()<10){
      text(hr + ":0" + min + ":" + sec + " " + end, 0, -230);
    }
    else if (second()<10){
      text(hr + ":" + min + ":0" + sec + " " + end, 0, -230);
    }
    else{
      text(hr + ":" + min + ":" + sec + " " + end, 0, -230);
    }  
  }
  
  private void displayDots(){
    //same technique as numbers
    strokeWeight(2);
    fill(0);
    for (int num = 1; num<=60; num++){
      if (num%5 == 0){
        dotSize = 5;
      }
      else{
        dotSize = 2;
      }
      ellipse(155*cos(2*PI*num/60-PI/2),155*sin(2*PI*num/60-PI/2),dotSize,dotSize);
    }
  }
  
  private void displayNumbers(){
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(20);
    for (int num = 1; num<=12; num++){
      //display num as text, rotating around the clock
      text(num, 180*cos(2*PI*num/12-PI/2), 180*sin(2*PI*num/12-PI/2));
    }
    fill(255);
  }
}
