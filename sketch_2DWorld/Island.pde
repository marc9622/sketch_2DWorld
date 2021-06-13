class Island extends Object {
  
  color beach = color(204, 179, 37);
  
  Island() {
    super(random(0, width), random(0, height), random(40, 80), color(230, 220, 34));
    sizeSquared = size * size;
  }
  
  void display() {
    fill(lerpColor(col, color(0), 0.1));
    noStroke();
    circle(x, y, size * 2 + 20 - world.getSeaHeight(x + y) * 20);
  }
  void displayTop() {
    fill(col);
    noStroke();
    circle(x, y, size * 2);
  }
}
