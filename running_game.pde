//Kaitlynn Chan
//2018-03-10
//1-1

import fisica.*;

//fisica
FWorld world;
final int INTRO = 1;
final int PAUSE = 2;
final int PLAYING = 3;
final int WIN = 4;
int mode = INTRO;

int x, y;

//colors
color black = color(0, 0, 0);
color white = color(255, 255, 255);
color brown = color(119, 59, 25);
color orange = color(255, 127, 39);
color blue = color(63, 72, 204);
color pink = color(255, 174, 201);
color lightblue = color(153, 217, 234);
color green = color(34, 177, 76);
color lightgreen = color(181, 230, 29);

int gridSize = 10;
PImage background, flag, diamond, teleporter;
PImage map;

ArrayList<FBox> terrain;
ArrayList<FBox> enemies;

boolean w, a, s, d, upkey, leftkey, rightkey, downkey, spacekey;

float dx;
FBox player;
FCheckpoint mycheckpoint = null;

PImage[] run;
PImage[] idle;
PImage[] jump;
PImage[] currentAction;
PImage[] coinpics = new PImage[4];
int costumeNumCoin = 0;
int frame = 0;
int coincollect = 0;
int teleporting = 2;
int tries = 1;

float xtext = -280;
float xtext2 = -250;
float teleporterx;
float teleportery;

boolean jumping = false;

void setup() {
  size(600, 200, FX2D);
  //rectMode(CORNER);
  map = loadImage("map.png");
  background = loadImage("gradient.jpg");
  flag = loadImage("flag.png");
  flag.resize(30, 50);
  diamond = loadImage("diamond.png");
  diamond.resize(gridSize, gridSize);
  teleporter = loadImage("teleporter.png");
  teleporter.resize(20, 20);

  loadWorld();
}

void draw() {
  image(background, 0, 0, width, height + 10);
  //background(white);
  //println(player.getX(), player.getY());//player.getX(), player.getY()

  //loading modes
  updateTerrain();
  updatePlayer();
  if (mode == INTRO) {
    drawIntro();
  } else if (mode == PAUSE) {
    pushMatrix();
    translate(-player.getX() + width/2, -player.getY() + height/2);
    world.draw();
    popMatrix();

    drawPause();
  } else if (mode == PLAYING) {
    pushMatrix();
    translate(-player.getX() + width/2, -player.getY() + height/2);
    world.step();
    world.draw();
    popMatrix();

    drawPlaying();
  } else if (mode == WIN) {
    pushMatrix();
    translate(-player.getX() + width/2, -player.getY() + height/2);
    world.step();
    world.draw();
    popMatrix();

    drawWin();
  }

  //checkpoint is played
  if (mycheckpoint != null) {
    mycheckpoint.act();
    if (mode == INTRO) {
      world.remove(mycheckpoint);
      mycheckpoint = null;
    }
  }
  
}

void mouseReleased() {
  if (mode == INTRO && dist(mouseX, mouseY, width/2, height/2) < 50) mode = PLAYING;
  if (mode == PLAYING && mouseX >= width - 30 && mouseX <= width - 21 && mouseY >= 10 && mouseY <= 30) mode = PAUSE;
  if (mode == PAUSE){
    if(mouseX >= width/2 - 28 && mouseX <= width/2 + 42 && mouseY >= height/2 - 58 && mouseY <= height/2 - 18) mode = PLAYING;
    if(mouseX >= width/2 - 40 && mouseX <= width/2 + 57 && mouseY >= height/2 - 5 && mouseY <= height/2 + 35) mode = INTRO;
  }
  if (mode == WIN && mouseX >= width/2 - 55 && mouseX <= width/2 + 83 && mouseY >= height/2 + 25 && mouseY <= height/2 + 60) mode = INTRO;
}

void keyPressed() {
  if (mode == PLAYING) {
    if (key == ' '){
      mycheckpoint = new FCheckpoint();
    }
    if (keyCode == LEFT) leftkey = true;
    if (keyCode == RIGHT) rightkey = true;
    if (keyCode == UP) upkey = true;
  }
}


void keyReleased() {
  if (key == ' ') spacekey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == UP) upkey = false;
}