class FCheckpoint extends FBox {
  float x, y;
  
  FCheckpoint(float _x, float _y) {
    super(gridSize, gridSize); 
    this.attachImage(diamond);
    x = _x;
    y = _y;
    this.setPosition(x, y);
    this.setStatic(true);
    this.setGrabbable(false);
    this.setName("check point");
    this.setSensor(true);
    world.add(this);
  }

  void act() {
  //if(resettocheckpoint == true){
    //  player.setPosition(x, y);
    //  //resettocheckpoint = false;
    //} 
    
    if (resettocheckpoint == 1) {
      player.setPosition(x, y);
      resettocheckpoint --;
    } else if (resettocheckpoint <= 0) {
      resettocheckpoint = 2;
    }
  }
  
  //void reset(){
  //  //resettocheckpoint--;
  //  //if (resettocheckpoint < -100) {
  //  //  resettocheckpoint = 2;
  //  //}
  //}

}
