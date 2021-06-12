class Tree extends Plant {
  
  Tree(float x, float y) {
    super(x, y, random(10, 20), color(57, 219, 39), random(40, 60));
  }
  
  void display() {
    
    fill(col);
    noStroke();
    circle(x, y, size);
    
    grow();
  }
}
