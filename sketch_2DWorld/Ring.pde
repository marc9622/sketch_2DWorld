class Ring extends MovingObject {
    
  Ring(float x, float y) {
    super(x, y, random(10, 15), color(255, 38, 38), random(0, 2 * PI), 2);
  }
  
  void display() {
    super.display();
    
    noFill();
    stroke(col);
    strokeWeight(tempSize / 1.5);
    circle(x, y, tempSize * 2);
  }
  
  void move() {
    bounceFromIsland();
    super.move(speed);
  }
  
  void bounceFromIsland() {
    float difX, difY;
    
    for(Island i : world.islands) {
      difX = i.x - x;
      difY = i.y - y;
      if(pow(difX, 2) + pow(difY, 2) < i.sizeSquared + sizeSquared) {
        if(difX >= 0) dirX = -abs(dirX);
        else          dirX =  abs(dirX);
        if(difY >= 0) dirY = -abs(dirY);
        else          dirY =  abs(dirY);
        return;
      }
    }
  }
}
