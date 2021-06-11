class Duck extends MovingObject {
  
  color beakColor = color(252, 182, 3);
  
  Duck(float x, float y) {
    super(x, y, random(15, 20), color(150, 122, 92), random(0, 2 * PI), 2);
  }
  
  void display() {
    super.display();
    
    fill(col);
    noStroke();
    fill(beakColor);
    triangle(
      x + 10, y + 5,
      x + 10, y - 5,
      x + 25, y
    );
    fill(col);
    ellipse(x, y, tempSize * 1.5, tempSize);
  }
  
  void move() {
    if(isOnIsland(x, y, sizeSquared))
      super.move(speed);
    else
      super.move(speed / 2);
  }
}
