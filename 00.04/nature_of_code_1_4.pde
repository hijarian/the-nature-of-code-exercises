/** 
 * Exercise 0.4
 * 
 * Consider a simulation of paint splatter drawn as a collection of colored dots.
 * Most of the paint clusters around a central position, but some dots splatter out toward the edges.
 * Can you use a normal distribution of random numbers to generate the positions of the dots?
 * Can you also use a normal distribution of random numbers to generate a color palette?
 * Try creating a slider to adjust the standard deviation.
 */

// Install Javafx Tool for the `FX2D` renderer 
import processing.javafx.*;

int TRANSPARENCY = 50;
int COLOR_WOBBLE = 30;

void setup() {
  // Install Javafx Tool for the `FX2D` renderer
  size(800, 800, FX2D);
  background(220);
  noStroke();
  fill(0, TRANSPARENCY);
  textAlign(LEFT, TOP);
}

void draw() {
  text("Click to splat paint", 0, 0);
}

void mouseClicked() {
  splat(mouseX, mouseY);
}

color makeRandomColor() {
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  return color(constrain(r, 0, 255), constrain(g, 0, 255), constrain(b, 0, 255));
}

color wobbleColor(color input) {
  int r = (input >> 16) & 0xFF;
  r += randomGaussian() * COLOR_WOBBLE;
  r = constrain(r, 0, 255);
  r = r << 16;
  int g = (input >> 8) & 0xFF;
  g += randomGaussian() * COLOR_WOBBLE;
  g = constrain(g, 0, 255);
  g = g << 8;
  int b = input & 0xFF;
  b += randomGaussian() * COLOR_WOBBLE;
  b = constrain(b, 0, 255);
  
  return 0xFF000000 | r | g | b;
}

void splat(int x, int y) {
  float number = 100 + randomGaussian() * 10;
  float spread = 30 + randomGaussian() * 2;
  color dropBaseColor = makeRandomColor();
  println(hex(dropBaseColor));
  for (int i = 0; i < number; ++i) {
    float dropX = x + randomGaussian()*spread;
    float dropY = y + randomGaussian()*spread;
    float dropSize = 16 + randomGaussian()*3;
    color dropColor = wobbleColor(dropBaseColor);
    println(hex(dropColor));
    fill(dropColor, TRANSPARENCY);
    circle(dropX, dropY, dropSize);
  }
}
