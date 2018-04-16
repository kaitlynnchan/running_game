void drawIntro() {
  fill(black);
  ellipse(width/2, height/2, 100, 100);
  textSize(28);
  fill(white);
  text("Play", width/2 - 23, height/2 + 9);

  textSize(20);
  text("The most annoying game ever", xtext, 30);
  xtext += 1;
  if (xtext >= width) {
    xtext = -280;
  }

  text("Play at your own risk", xtext2, 180);
  xtext2 += 2;
  if (xtext2 >= width) {
    xtext2 = -250;
  }
  
  //reset
  player.setPosition(50, 50);
  tries = 1;
}

void drawPause() {
  textSize(20);
  fill(black);
  text("Tries: " + tries, 20, 25);
  text("press the spacekey to place checkpoints", width/2 - 170, 185);

  fill(black, 100);
  rect(-1, -1, width + 2, height + 2);

  textSize(30);
  fill(black);
  rect(width/2 - 28, height/2 - 53, 70, 40); //play
  rect(width/2 - 40, height/2 + 5, 97, 40); //home
  fill(white);
  text("Play", width/2 - 20, height/2 - 25);
  text("Home", width/2 - 32, 135);
}

void drawPlaying() {
  textSize(20);
  fill(black);
  text("Tries: " + tries, 20, 25);
  text("press the spacekey to place checkpoints", width/2 - 170, 185);
  text("||", width - 30, 25);
}

void drawWin() {
  textSize(28);
  fill(black);
  text("You Win", width/2 - 50, height/2 - 30);
  text("Tries: " + tries, width/2 - 50, height/2 + 8);
  rect(width/2 - 55, height/2 + 25, 138, 35);
  fill(white);
  text("Play Again", width/2 - 50, height/2 + 50);
}