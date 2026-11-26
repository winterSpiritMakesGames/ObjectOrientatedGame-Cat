/* USE WASD TO MOVE PLAYER 1 IF PLAYING SINGLE PLAYER.
 
 IF YOU'RE PLAYING 2 PLAYER, WASD AND ZXC FOR PLAYER 1, ARROW KEYS AND JKL FOR PLAYER 2
 */

// global variables
boolean gameOver = false;
boolean multiplayer = false;
boolean isReset = false;

//arrayLists
ArrayList<Lives> lives = new ArrayList<Lives>();
ArrayList<PImage> cat1Animations = new ArrayList<PImage>();

//string for player choice
String catChoice = "";

void setup() {
  size(700, 500);
  for (int i = 0; i < 3; i++) {
    lives.add(new Lives());
  }
}
