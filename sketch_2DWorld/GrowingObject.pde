class GrowingObject extends Object {
  
  float maxSize;
  
  GrowingObject(float x, float y, float size, color col, float maxSize) {
    super(x, y, size, col);
    this.maxSize = maxSize;
  }
  
  void grow() {
    if(size < maxSize)
      size += 0.1;
  }
}
