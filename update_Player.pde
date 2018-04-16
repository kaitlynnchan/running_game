void updatePlayer() {
  //key controls
  if (leftkey == false) dx = 0;
  if (rightkey == false) dx = 0;

  if (leftkey == true) dx -= 200;
  if (rightkey == true) dx += 200;

  if (upkey == true && jumping == true) player.setVelocity(player.getVelocityX(), -200);

  player.setVelocity(dx, player.getVelocityY());

  //contacting array
  ArrayList<FContact> contacts;
  contacts = player.getContacts();
  jumping = false;
  for (FContact c : contacts) {
    if (c.contains("ground")) jumping = true;
    if (c.contains("flag")) mode = WIN;

    if (c.contains("player", "oblivion") || c.contains("player", "spike") || c.contains("player", "spike up")) {
      player.setPosition(50, 50);
      
      //if (mycheckpoint != null) {
      //  player.setPosition(mycheckpoint.getX(), mycheckpoint.getY());
      //}
      //resettocheckpoint = true;
      resettocheckpoint = 1;
      //  //if(resettocheckpoint == true){
      //  //  player.setPosition(c.length(), c.length());
      //  //}
      tries += 1;
    }  else {
      //resettocheckpoint = 2;
    }

    if (c.contains("start teleporter")) {
      player.setPosition(teleporterx, teleportery);
    }
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
