class FCheckpoint extends FBox {
  
  FCheckpoint() {
    super(gridSize, gridSize); 
    this.attachImage(diamond);
    this.setPosition(player.getX(), player.getY());
    this.setStatic(true);
    this.setGrabbable(false);
    this.setName("check point");
    this.setSensor(true);
    world.add(this);
  }

  void act() {
  }

}