class MovingObject extends Object {

  float speed;
  float dirX, dirY;
  float sizeSquared;
  float tempSize;
  
  MovingObject(float x, float y, float size, color col, float dirAngle, float speed) {
    super(x, y, size, col);
    dirX = cos(dirAngle);
    dirY = sin(dirAngle);
    this.speed = speed;
    sizeSquared = size * size;
  }
  
  void display() {
    tempSize = getHeight(x + y) * 3 + size; 
  }
  
  void move(float speed) {
    bounceFromWall();
    x += dirX * speed;
    y += dirY * speed;
    println(dirX + " " + dirY);
  }
  
  void bounceFromWall() {
    if(x > width + size)  dirX = -abs(dirX);
    if(x < -size)         dirX =  abs(dirX);
    if(y > height + size) dirY = -abs(dirY);
    if(y < -size)         dirY =  abs(dirY);
  }
}
