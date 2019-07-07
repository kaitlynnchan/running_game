//Kaitlynn Chan
//2018-03-10
//1-1

import fisica.*;

//fisica
FWorld world;

final int INTRO = 1;
final int PLAYING = 2;
final int WIN = 3;
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
PImage teleporter, background, flag, diamond;
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
  terrain = new ArrayList<FBox>();
  enemies = new ArrayList<FBox>();
  map = loadImage("map.png");
  background = loadImage("gradient.jpg");
  flag = loadImage("flag.png");
  flag.resize(30, 50);
  diamond = loadImage("diamond.png");
  diamond.resize(gridSize, gridSize);
  //teleporter = loadImage("teleporter.png");
  //teleporter.resize(32, 32);
  

  //coinpics[0] = loadImage("coin0.png");
  //coinpics[1] = loadImage("coin1.png");
  //coinpics[2] = loadImage("coin2.png");
  //coinpics[3] = loadImage("coin3.png");

  loadWorld();
}

void draw() {
  image(background, 0, 0, width, height + 10);
  //background(white);
  //println(player.getX(), player.getY());//player.getX(), player.getY()

  updateTerrain();
  updatePlayer();
  if (mode == INTRO) {
    drawIntro();
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



  //image(coinpics[frame], 60, 50);
  //textSize(30);
  //fill(white);
  //text(coincollect, 30, 80);
  //if (frameCount % 20 == 0) {
  //  frame++;
  //  if (frame == 3) frame = 0;
  //}
}

void mouseReleased(){
 if(mode == INTRO){
   if(dist(mouseX, mouseY, width/2, height/2) < 50) mode = PLAYING;
 }
 if(mode == WIN){
   if(mouseX >= width/2 - 55 && mouseX <= width/2 + 83 && mouseY >= height/2 + 25 && mouseY <= height/2 + 60) mode = INTRO;
 }
}

void keyPressed() {
  if (key == ' ') mycheckpoint = new FCheckpoint();
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == UP) upkey = true;
}


void keyReleased() {
  if (key == ' ') spacekey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == UP) upkey = false;
}