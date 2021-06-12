class Plant extends Object {
  
  float maxSize;
  
  Plant(float x, float y, float size, color col, float maxSize) {
    super(x, y, size, col);
    this.maxSize = maxSize;
  }
  
  void grow() {
    if(size < maxSize)
      size += 0.1;
  }
}
