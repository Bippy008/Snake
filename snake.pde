class Snake {
  // State
  final int COLOUR = 0xFFB600B7;
  final int DEAD_COLOUR = 0xFFB442B4;
  final int SCORE_SIZE = 100;
  final int MESSAGE_SIZE = 450;
  final int MESSAGE_COLOUR = 0xFFCE060D;
  
  int[] x;
  int[] y;
  int dx;
  int dy;
  int head;
  int length;
  boolean alive;
  Field field;
  int colour;
  
  // Behaviour
  Snake(Field field, int x, int y, int dx, int dy) {
    this.field = field;
    
    this.dx = dx;
    this.dy = dy;
    
    head = 0;
    length = 7;
    alive = true;
    
    this.x = new int[length];
    this.y = new int[length];
    for (int i = 0; i< length; i++) {
      this.x[i] = x;
      this.y[i] = y;
    }
    colour = COLOUR;
    
    score = 0;
  }
  
  boolean isColliding(int x, int y) {
    for (int i = 0; i < length; i++) {
      if (this.x[i] == x && this.y[i] == y) {
        return true;
      }
    }
    
    return false;
  }
  
  void turnUp() {
    if (dy != 1) {
      dx = 0;
      dy = -1;
    }
  }
  
  void turnDown() {
    if (dy != -1) {
      dx = 0;
      dy = 1;
    }
  }
  
  void turnLeft() {
    if (dx != 1) {
      dx = -1;
      dy = 0;
    }
  }
  
  void turnRight() {
    if (dx != -1) {
      dx = 1;
      dy = 0;
    }
  }
  
  void move() {
    if (!alive) return;
    
    int nextX = x[head] + dx;
    int nextY = y[head] + dy;
    if (field.areCoordsInside(nextX, nextY) && !isColliding(nextX, nextY)) {  
      if (apple.isColliding(nextX, nextY)) {
        apple = new Apple();
        
        head = (head + 1) % length;
        int[] newX = new int[length +1];
        int[] newY = new int[length + 1];
        for (int i = 0; i < head; i++) {
          newX[i] = x[i];
          newY[i] = y[i];
        }
        newX[head] = nextX;
        newY[head] = nextY;
        for (int i = head; i < length; i++) {
          newX[i + 1] = x[i];
          newY[i + 1] = y[i];
        }
        x = newX;
        y = newY;
        
        length++;
        score++;
      } else {
        head = (head + 1) % length;
        x[head] = nextX;
        y[head] = nextY;
      }
    } else {
      alive = false;
      colour = DEAD_COLOUR;
    }
  }
  
  void draw() {
    noStroke();
    fill(colour);
    for (int i = 0; i < length; i++) {
      int pixelX = centerintShiftX + x[i] * cellPixelSize;
      int pixelY = centerintShiftY + y[i] * cellPixelSize;
      image(snakeImage, pixelX, pixelY, cellPixelSize, cellPixelSize);
    }   
    
    if (!alive) {
      state = DEFEAT_STATE;
    }
  }
    
  void drawScore() {
    fill(COLOUR);
    textAlign(CENTER, CENTER);
    textSize(SCORE_SIZE);
    text("Score: " + score, 3 * SCORE_SIZE, height/2);
  }
}
