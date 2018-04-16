void updateTerrain() {
}

void makeOblivion() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.setFillColor(black);
  b.setStrokeColor(black);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("oblivion");
  world.add(b);
}

void makeGround() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.setFillColor(brown);
  b.setStrokeColor(brown);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("ground");
  world.add(b);
}

void makeSpike() {
  FPoly b = new FPoly();
  b.vertex(x * gridSize, y * gridSize + gridSize);
  b.vertex(x * gridSize + gridSize, y * gridSize + gridSize);
  b.vertex(x * gridSize + gridSize/2, y * gridSize);
  b.setFillColor(blue);
  b.setStrokeColor(black);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("spike");
  world.add(b);
}
void makeSpikeUp() {
  FPoly b = new FPoly();
  b.vertex(x * gridSize, y * gridSize);
  b.vertex(x * gridSize + gridSize, y * gridSize);
  b.vertex(x * gridSize + gridSize/2, y * gridSize + gridSize);
  b.setFillColor(blue);
  b.setStrokeColor(black);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("spike up");
  world.add(b);
}

void makeFlag() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(flag);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("flag");
  world.add(b);
}

void makeTeleporter() {
  FCircle b = new FCircle(gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  //b.setFillColor(green);
  //b.setStrokeColor(black);
  b.attachImage(teleporter);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(true);
  b.setName("start teleporter");
  world.add(b);
}

void makeTeleporterEnd() {
  FCircle b = new FCircle(gridSize);
  teleporterx = x * gridSize + gridSize/2;
  teleportery = y * gridSize + gridSize/2;
  b.setPosition(teleporterx, teleportery);
  b.attachImage(teleporter);
  //b.setFillColor(lightgreen);
  //b.setStrokeColor(black);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("end teleporter");
  world.add(b);
}