class Flower extends GrowingObject {
  
  Flower(float x, float y) {
    super(x, y, random(5, 10), color(39, 177, 219), random(10, 20));
  }
  
  void display() {
    
    fill(col);
    noStroke();
    ellipse(x, y, size * 2, size);
    ellipse(x, y, size, size * 2);
    
    grow();
  }
}
