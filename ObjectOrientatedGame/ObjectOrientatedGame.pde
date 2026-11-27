/* USE WASD TO MOVE PLAYER 1 IF PLAYING SINGLE PLAYER.
 
 IF YOU'RE PLAYING 2 PLAYER, WASD AND ZXC FOR PLAYER 1, ARROW KEYS AND JKL FOR PLAYER 2
 */

// global variables
boolean gameOver = false;
boolean multiplayer = false;
boolean isReset = false;
boolean gameStart = false;
boolean choiceDone = false;
boolean trainingBool = false;

//int
int randomMap;
int timer;

//PVector (gravity)
PVector gravity = new PVector(0, -9.8);

//arrayLists
ArrayList<Lives> lives = new ArrayList<Lives>();
ArrayList<PImage> cat1Animations = new ArrayList<PImage>();

//string for player choice
String catChoice = "";

//colors
color startingScreen = color(178, 244, 255);

//PImages

//button images
PImage singlePlayer;
PImage multiPlayer;
PImage training;
PImage icon;

//Classes

Player player = new Player();

void setup() {
  size(700, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  for (int i = 0; i < 700; i= i+ 100) {
    line(i, 0, i, 500);
  }
  for (int i = 0; i < 500; i= i+ 100) {
    line(0, i, 700, i);
  }
  singlePlayer = loadImage("Asset 1.png");
  multiPlayer = loadImage("Asset 2.png");
  training = loadImage("Asset 3.png");
  icon = loadImage("Asset 4.png");
  for (int i = 0; i < 3; i++) {
    lives.add(new Lives());
  }
}

void draw() {
  //background(startingScreen);
  if (!gameStart) {
    //singleplayer button
    fill(100, 0, 0);
 //   rect(500, 200, 200, 100);
   image(singlePlayer, 300, 100, 350, 100);
   image(multiPlayer, 375, 210, 275, 90);
   image(training, 300, 320, 355, 90);
  }
  if (trainingBool) {
    gameStart = true;
    player.display();
    player.move();
  }
  if (choiceDone) {
    println("Player Choice Selected");
  }
}
void mousePressed() {
  if (!gameStart) {
    if ((mouseX > 300 && mouseX < 600) && (mouseY >100 && mouseY <200)) {
      println("Pressed training");
      trainingBool = true;
    }
  }
}
void keyPressed() {
  if (!multiplayer) {
    if (key == 'w') {
      player.jump();
    }
    if (key == 'a') {
      player.left = true;
    }
    if (key == 's') {
      player.dodge = true;
    }
    if (key == 'd') {
      player.right = true;
    }
  }
}
void keyReleased(){
  if (!multiplayer) {
    if (key == 'a') {
      player.left = false;
    }
    if (key == 's') {
      player.dodge = false;
    }
    if (key == 'd') {
      player.right = false;
    }
  }
}
