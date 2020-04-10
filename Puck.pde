class Puck {
  
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12;
  boolean k = false;
  int speed = 0;
  
 
  
  
  Puck() {
     reset();       
  }  
  
  void checkPaddleLeft(Paddle p) {
    if (y < p.y + p.h/2 &&  y > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2); 
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 5 * cos(angle) + speed;
        yspeed = 5 * sin(angle) + speed;  
        //xspeed *=2;
        //yspeed *=2;
        x = p.x + p.w/2 + r;
        speed ++;

   
      } 
    }
  }  
  
  
  void checkPaddleRight(Paddle p) {
    if (y < p.y + p.h/2 &&  y >p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        float diff = y - (p.y - p.h/2); 
        //float rad = radians(225);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = 5 * cos(angle) - speed;
        yspeed = 5 * sin(angle) - speed;  
        //xspeed *=2;
        //yspeed *=2;
        x = p.x - p.w/2 - r;
        speed ++;
       
      } 
    }
  }  

    



  void update() {
    x += xspeed;
    y += yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2; 
    xspeed = 0;
    yspeed = 0;
    speed = 0;
    k = false;
    start();      
  }

  void edges() {
    if (y - r < 0 || y + r > height) {
      yspeed *= -1;
    }


    if (x - r > width ) {
      //ding.play();
      leftscore ++;
      reset();
        
        
      
    }

    if (x + r < 0) {
      //ding.play();
      rightscore ++;
      reset();
      
    }
  }
  
  
void win() {
  if (leftscore == 5) {
    fill(255,0,0);
    textSize(100);
    text( "You WIN!" , width/2-200, height/2);
    rematch();

}
  if (rightscore == 5) { 
    fill(0,0,255);
    textSize(100);
    text( "You WIN!" , width/2-200, height/2);
    rematch();

  }  
  
  
  
  
  
  
    
    
  
}  
  

void start() {
  if (leftscore != 5 || rightscore != 5) {
    if (key == ' ' && k == false) {
      float angle = random(-PI/4, PI/4);
      xspeed = 5 * cos(angle);
      yspeed = 5 * sin(angle); 
      k = true;
      if (random(1) < 0.5) {
        xspeed *= -1;  
      }  
    }  
  }          
}

void rematch() {
  if (leftscore == 5 || rightscore == 5) {
    if (key == ' ' ) {
      rightscore = 0;
      leftscore = 0;
    }
  }  
}    
      

  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }

}
