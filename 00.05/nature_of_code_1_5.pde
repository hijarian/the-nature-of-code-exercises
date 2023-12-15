/**
 * Exercise 0.5
 * 
 * A Gaussian random walk is defined as one in which the step size
 * (how far the object moves in a given direction)
 * is generated with a normal distribution.
 * Implement this variation of the Walker class.
 */

int getStepSize() {
  return int(1 + randomGaussian() * 3);
}

/** 50% of the time returns -1, 50% of the time returns +1 */
int getRandomDirectionFlag() {
  float value = random(1);
  return (value < 0.5) ? -1 : +1;
}

class Walker {
  int x;
  int y;
  int size = 16;
  Walker() {
    x = width/2;
    y = height/2;
  }
  void display() {
    stroke(0);
    fill(100);
    circle(x, y, size);
  }

  void step() {
    x += getRandomDirectionFlag() * getStepSize();
    y += getRandomDirectionFlag() * getStepSize(); 
  }
}

Walker w;

void setup() {
  size(400, 400);
  w = new Walker();
  background(220);
}

void draw() {
  w.step();
  w.display();
}
