class Field {
  // State (vars)
  final int COLOR = 0xFFDD6FFF;
  
  int width;
  int height;
  
  // Behaviour (methods)
  Field(int width, int height) {
    this.width = width;
    this.height = height;
  }
  
  boolean areCoordsInside(int x, int y) {
    return x >= 0 && x < width &&
           y >= 0 && y < height;
  }
  
  void draw() {
    noStroke();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int pixelX = centerintShiftX + x * cellPixelSize;
        int pixelY = centerintShiftY + y * cellPixelSize;
        fill (COLOR);
        rect(pixelX, pixelY, cellPixelSize, cellPixelSize);
      }
    }
  }
}
