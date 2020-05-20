final int MENU_STATE = 1;
final int GAME_STATE = 2;
final int PAUSE_STATE = 3;
final int DEFEAT_STATE = 4;

final int TITLE_SIZE = 100;
final int TITLE_COLOR = 0xFFF505BD;

int state = MENU_STATE;
int score;

Field field = new Field(20, 20);
Snake snake = new Snake(field, 0, 0, 0, 1);
Apple apple = new Apple();

void setup() {
  fullScreen();
  background(0);
  
  recalcDrawingSizes();
  loadImages();
  loadFonts();
}

void draw() {
  background(0);
  
  switch (state) {
    case MENU_STATE:
      drawMenu();
      break;
    case GAME_STATE:
      drawGame();
      break;
    case DEFEAT_STATE:
      drawDefeat();
      break;
    case PAUSE_STATE:
      drawPause();
      break;
  }
}
  
void drawMenu() {
  image(backgroundMenuImage, 0, 0, width, height);
  
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("SNAKE!", width/2, height/2);
  
  fill(200);
  textSize(60);
  text("Press Enter to start the game", width/2, height/2 + 100);
}
  
void drawGame() {
  textSize(TITLE_SIZE);
  textAlign(CENTER, CENTER);
  text("SNAKE", width/2, TITLE_SIZE);
  
  snake.move();
  snake.drawScore();
  
  field.draw();
  apple.draw();
  snake.draw();
  
  delay(100);
}

void drawPause() {
  image(backgroundPauseImage, 0, 0, width, height);
  
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Why did you stop?", width/2, height/2);
  
  textSize(50);
  text("press Space to continue", width/2, height/2 + 100);
}

float angle = 0;

void drawDefeat() {
  
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < 100; i++) {
    rotate(angle);
    angle += 0.00005;
    translate(i * 10, 0);
    fill(200 * i / 100.0);
    image(starImage, 0, 0, 100, 100);    
  }    
  popMatrix();
  
  fill(200, 0, 0);
  textSize(100); 
  text("you collected " + score + " points", width/2, height/4);
    
  fill(255);
  textAlign(CENTER, CENTER);
  text("you hit the wall and see the stars", width/2, height/2);
  text("maybe game cannot be pass?", width/2, height/2 + 120);
  
  fill(200);
  textSize(50);
  text("press Enter to return to menu", width/2, height/2 + 200);
}

void keyPressed() {
  switch (state) {
    case MENU_STATE:
      keyPressedInMenu();
      break;
    case GAME_STATE:
      keyPressedInGame();
      break;
    case DEFEAT_STATE:
      keyPressedInDefeat();
      break;
    case PAUSE_STATE:
      keyPressedOnPause();
      break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    state = GAME_STATE;
    score = 0;
  }
}

void keyPressedInGame() {
  switch (keyCode) {
    case UP:
      snake.turnUp();
      break;
    case DOWN:
      snake.turnDown();
      break;
    case LEFT:
      snake.turnLeft();
      break;
    case RIGHT:
      snake.turnRight();
      break;
  }
  
  switch (key) {
    case ' ':
      state = PAUSE_STATE;
  }
}

void keyPressedOnPause() {
  if (key == ' ') {
    state = GAME_STATE;
  }
}

void keyPressedInDefeat() {
  if (keyCode == ENTER) {
    state = MENU_STATE;
  }
}
