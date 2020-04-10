class Paddle {
  float x;
  float y = height/2;
  float w = 10;
  float h = 100;
  float ychange=0;
  color c;
  int computerSpeed = 20;
 




Paddle(boolean left) {
  if (left) {
    x = w;
    c = color(255,0,0);
  } else {
    x = width-w;
    c = color(0,0,255);
  }
}

void update() {
  y += ychange;
  y = constrain(y,h/2,height-h/2);
}

void move(float steps) {
  ychange = steps;
}

void leftcomputer() {
 
    if ( left.y  < puck.y ) {
        left.move(computerSpeed);
    }  
    if ( left.y  > puck.y ) {
        left.move(-computerSpeed);
    }
    //if ( left.y - h/2 < puck.y && left.y  > puck.y) {
    //  left.move(0);
    //}  


  
}    

void rightcomputer() {
    if ( right.y < puck.y ) {
        right.move(computerSpeed);
    }  
    if ( right.y  > puck.y ) {
        right.move(-computerSpeed);
    }
    //if ( right.y - h/2 < puck.y && right.y  > puck.y){
    //  right.move(0);
    //}  
  
}



void show() {
    fill(c);
    rectMode(CENTER);
    rect(x, y, w, h, 20);
}
  
  
  
  
}


  
