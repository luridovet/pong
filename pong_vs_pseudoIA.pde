

//This code was inspired by Daniel Shiffman, in his 67th 'Coding Challenge' : https://youtu.be/IIrC5Qcb2G4.

//How to play:
//Press the arrow at the top left of the screen, it should open a window. Then click on this window to be able to play.
//If you are the blue player, 'i' is to get ip and 'k' is to get down.
//If you are the red player, 'w' is to get ip and 's' is to get down.
//Move your paddle to stop the ball from hitting your wall.
//To play against 'AI', add 'right.rightcomputer(); ' if you want to play as red, or 'left.leftcomputer(); ' if you want to play as blue, where ' //add command for computer here ' is written.
//I would like to add that my ' AI' is not perfect, and that adjustement needs to be made to make it a god of pong, that perhaps only you could defeat!
//Enjoy!



//import processing.sound.*;
//SoundFile ding;

Puck puck;

Paddle left;
Paddle right;

int leftscore =0;
int rightscore = 0;

void setup() {
  size(640, 360);
  //ding = new SoundFile(this, "ding.mp3");
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  background(0);
  
  //puck.checkPaddle(left);
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);
  
  puck.start();
  puck.rematch();
  
 
  
  left.show();
  right.show();
  left.update();
  right.update();
  
  //add command for computer here
  //left.leftcomputer();
  right.rightcomputer();

  puck.update();
  puck.edges();
  puck.show();
  
  fill(255);
  textSize(30);
  text(leftscore, 10, 40);
  text(rightscore, width-20, 40);
  
  puck.win();
  


}


void keyReleased() {
  left.move(0);
  right.move(0);
}
  
  


void keyPressed() { 
  if ( key == 'o'){
    right.move(-10);  
  } else if ( key == 'k'){
    right.move(10);
  }    
  
  if ( key == 'w'){
    left.move(-10);  
  } else if ( key == 's'){
    left.move(10);
  }      

}
