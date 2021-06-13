class World {
    
  ArrayList<MovingObject> movingObjects = new ArrayList<MovingObject>();
  ArrayList<GrowingObject> plants = new ArrayList<GrowingObject>();
  Island[] islands;
  
  color sea = color(43, 109, 214);
  //Kvaliteten af den bølgelignende bevægelse i baggrunden.
  int waveSize = 50;
    
  int time;
    
  World(int islandAmount) {
    createIslands(islandAmount);
  }
  
  void createIslands(int amount) {
    islands = new Island[amount];
    for(int i = 0; i < islands.length; i++) {
      islands[i] = new Island();
    }
  }
  
  void display() {
    time = millis();
    
    drawSea();
    
    for(Island i : islands) {
      i.display();
    }
    for(Island i : islands) {
      i.displayTop();
    }
    for(MovingObject d : movingObjects) {
      d.display();
      d.move();
    }
    for(GrowingObject p : plants) {
      p.display();
    }
  }
  
  void drawSea() {
    background(sea);
    
    for(int i = 0; i < width + height + waveSize * 2; i += waveSize / 5) {
      stroke(color(255, 255, 255, getSeaHeight(i) * 20));
      strokeWeight(waveSize);
      line(i, -waveSize, -waveSize, i);
    }
  }
  
  boolean isPosOnIsland(float x, float y, float sizeSquared) {
    float difX, difY;
    for(Island i : islands) {
      difX = i.x - x;
      difY = i.y - y;
      if(pow(difX, 2) + pow(difY, 2) < i.sizeSquared + sizeSquared) {
        return true;
      }
    }
    return false;
  }
  
  void createObject(float x, float y, boolean isLeftMouseButton) {
    
    if(isPosOnIsland(x, y, 0)) {
      if(isLeftMouseButton)
        plants.add(new Tree(x, y));
      else
        plants.add(new Flower(x, y));
    }
    else {
      if(isLeftMouseButton)
        movingObjects.add(new Ring(x, y));
      else
        movingObjects.add(new Duck(x, y));
    }
  }
  
  float getSeaHeight(float x) {
    return 1 - abs(sin(-x / 500f + time / 1000f));
  }
  
}
