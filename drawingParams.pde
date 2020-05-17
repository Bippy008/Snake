PFont mainFont;
PImage backgroundMenuImage;
PImage backgroundPauseImage;
PImage backgroundDefeatImage;

void loadFonts() {
  mainFont = createFont("shrift.ttf", 32);
  textFont(mainFont);
}

void loadImages() {
  backgroundMenuImage = loadImage("bg1.jpeg");
  backgroundPauseImage = loadImage("bg2.jpeg");
  backgroundDefeatImage = loadImage("bg3.jpeg");
}
