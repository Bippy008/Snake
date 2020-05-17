int cellPixelSize = 35;
int centerintShiftX;
int centerintShiftY;

void recalcDrawingSizes() {
  centerintShiftX = (width - field.width * cellPixelSize)/2;
  centerintShiftY = (height - field.height * cellPixelSize)/2;
}
