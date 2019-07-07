void loadWorld() {

  //init world
  Fisica.init(this);
  world = new FWorld(-1000, -1000, 10000, 10000);//-1000, -1000, 10000, 10000
  world.setGravity(0, 980);

  while (y < map.height) {
    color c = map.get(x, y);
    if (c == black) makeOblivion();
    if (c == brown) makeGround();
    if (c == orange) makeCharacter();
    if (c == blue) makeSpike();
    if (c == pink) makeFlag();
    if (c == lightblue) makeSpikeUp();
    if (c == green) makeTeleporter();
    if (c == lightgreen) makeTeleporterEnd();

    x++;
    if (x > map.width) {
      y++;
      x = 0;
    }
  }
}