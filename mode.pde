void drawIntro(){
  fill(black);
  ellipse(width/2, height/2, 100, 100);
  textSize(28);
  fill(white);
  text("Play", width/2 - 23, height/2 + 9);
  
  textSize(20);
  text("The most annoying game ever", xtext, 30);
  xtext += 1;
  if(xtext >= width){
    xtext = -280;
  }
  
  text("Play at your own risk", xtext2, 180);
  xtext2 += 2;
  if(xtext2 >= width){
    xtext2 = -250;
  }
  
  player.setPosition(50, 50);
  tries = 1;
}

void drawPlaying(){
  textSize(20);
  fill(black);
  text("Tries: " + tries, 20, 25);
  text("press the spacekey to place checkpoints", width/2 - 170, 185);
  
  //mycheckpoint = new FCheckpoint();
  if(mycheckpoint != null){
    mycheckpoint.act();
  }
}

void drawWin(){
  textSize(28);
  fill(black);
  text("You Win", width/2 - 50, height/2 - 30);
  text("Tries: " + tries, width/2 - 50, height/2 + 8);
  rect(width/2 - 55, height/2 + 25, 138, 35);
  fill(white);
  text("Play Again", width/2 - 50, height/2 + 50);
}