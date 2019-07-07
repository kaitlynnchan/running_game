void updatePlayer() {
  //currentAction = run;
  //dx += 200;

  if (leftkey == false) dx = 0;
  if (rightkey == false) dx = 0;
  //if(upkey == false)
  //if (spacekey == false) {
  //  //currentAction = run;
  //}

  if (leftkey == true) dx -= 200;
  if (rightkey == true) dx += 200;
  //if (spacekey == true && jumping == true) {
  //  player.setVelocity(player.getVelocityX(), -200);
  //}
  if(upkey == true && jumping == true) player.setVelocity(player.getVelocityX(), -200);

  player.setVelocity(dx, player.getVelocityY());

  //boolean touchingWater = false;
  //contacting array
  ArrayList<FContact> contacts;
  contacts = player.getContacts();
  jumping = false;
  for (FContact c : contacts) {
    if (c.contains("ground")) jumping = true;
    if (c.contains("flag")) mode = WIN;
    if(c.contains("oblivion") || c.contains("spike") || c.contains("spike up")){
      player.setPosition(50, 50);
      if(mycheckpoint != null){
        player.setPosition(mycheckpoint.getX(), mycheckpoint.getY());
      }
        
      tries += 1;
    }
    
    if(c.contains("start teleporter")){
      player.setPosition(teleporterx, teleportery);
    }
    //if (c.contains("player", "coin")) {
    //  FBody a = c.getBody1();
    //  FBody b = c.getBody2();
    //  if (a == player) {
    //    coincollect += 1;
    //    world.remove(b);
    //  } else {
    //    coincollect += 1;
    //    world.remove(b);
    //  }
    //}
  }
}

void makeCharacter() {
  player = new FBox(gridSize, gridSize);
  player.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  player.setFillColor(orange);
  player.setStrokeColor(black);
  player.setStatic(false);
  player.setGrabbable(true);
  player.setRotatable(false);
  player.setName("player");
  world.add(player);
}