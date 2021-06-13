World world;

void setup() {
  size(500, 500);
  world = new World(8);
}

void draw() {
  world.display();
}

void mousePressed() {
  boolean isLeftMouseButton = mouseButton == LEFT;
  world.createObject(mouseX, mouseY, isLeftMouseButton);
}
