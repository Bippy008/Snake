PFont mainFont;
PImage backgroundMenuImage;
PImage backgroundPauseImage;
PImage backgroundDefeatImage;
PImage snakeImage;
PImage grassImage;
PImage appleImage;

void loadFonts() {
  mainFont = createFont("shrift.ttf", 32);
  textFont(mainFont);
}

void loadImages() {
  backgroundMenuImage = loadImage("bg1.jpeg");
  backgroundPauseImage = loadImage("bg2.jpeg");
  backgroundDefeatImage = loadImage("bg3.jpeg");
  snakeImage = loadImage("snake.png");
  grassImage = loadImage("grass.png");
  appleImage = loadImage("apple.png");
}
