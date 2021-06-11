ArrayList<Duck> ducks = new ArrayList<Duck>();
ArrayList<Ring> rings = new ArrayList<Ring>();
Island[] islands = new Island[5];

color sea = color(43, 109, 214);
//Kvaliteten af den bølgelignenden bevægelse i baggrunden. Mindre værdier = højere opløsning = mere lag.
int waveSize = 50;

int time;

void setup() {
  size(500, 500);
  
  for(int i = 0; i < islands.length; i++) {
    islands[i] = new Island();
  }
}

void draw() {
  time = millis();
  
  drawSea();
  

  for(Island i : islands) {
    i.display();
  }
  for(Island i : islands) {
    i.displayTop();
  }
  for(Duck d : ducks) {
    d.display();
    d.move();
  }
  for(Ring r : rings) {
    r.display();
    r.move();
  }
}

void drawSea() {
  background(sea);
  
  for(int i = 0; i < width + height + waveSize * 2; i += waveSize / 5) {
    stroke(color(255, 255, 255, getHeight(i) * 20));
    strokeWeight(waveSize);
    line(i, -waveSize, -waveSize, i);
  }
}

float getHeight(float x) {
  return 1 - abs(sin(-x / 500f + time / 1000f));
}

boolean isOnIsland(float x, float y, float sizeSquared) {
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

void mousePressed() {
  
  if(isOnIsland(mouseX, mouseY, 0)) {
    if(mouseButton == LEFT)
      rings.add(new Ring(mouseX, mouseY));
    if(mouseButton == RIGHT)
      ducks.add(new Duck(mouseX, mouseY));
  }
  else {
    if(mouseButton == LEFT)
      rings.add(new Ring(mouseX, mouseY));
    if(mouseButton == RIGHT)
      ducks.add(new Duck(mouseX, mouseY));
  }
}
