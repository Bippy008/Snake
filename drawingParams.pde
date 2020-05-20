PFont mainFont;
PImage backgroundMenuImage;
PImage backgroundPauseImage;
PImage snakeImage;
PImage grassImage;
PImage appleImage;
PImage starImage;

void loadFonts() {
  mainFont = createFont("shrift.ttf", 32);
  textFont(mainFont);
}

void loadImages() {
  backgroundMenuImage = loadImage("bg1.jpeg");
  backgroundPauseImage = loadImage("bg2.jpeg");
  snakeImage = loadImage("snake.png");
  grassImage = loadImage("grass.png");
  appleImage = loadImage("apple.png");
  starImage = loadImage("star.png");
}
