class Apple {
  // state
  final int COLOR = 0xFFD60490;  
  int x, y;
  
  // behaviour
  Apple() {
    do {
    x = (int) random(field.width);
    y = (int) random(field. height);
    } while(snake.isColliding(x, y));
  }

  
  boolean isColliding(int x, int y) {
    return this.x == x && this.y == y;
  }
  
  void draw() {
    noStroke();
    fill(COLOR);
    
    int pixelX = centerintShiftX + x * cellPixelSize;
    int pixelY = centerintShiftY + y * cellPixelSize;
    rect(pixelX, pixelY, cellPixelSize, cellPixelSize);
  }
}
