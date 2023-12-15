/**
 * Exercise 0.6
 * 
 * Use a custom probability distribution to vary the size of the random walker's steps.
 * The step size can be determined by influencing the range of values picked
 * with a qualifying random value.
 * Can you map the probability to a quadratic function by making the likelihood
 * that a value is picked equal to the value squared?
 */

float makeRandomValue(int max) {
  while (true) {
    float value = random(-1, 1);
    float probability = value * value;
    float check = random(1);
    if (probability < check) {
      return value * max;
    }
  }
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
    int maxStepSize = 10;
    float stepx = makeRandomValue(maxStepSize);
    float stepy = makeRandomValue(maxStepSize);
    
    x += stepx;
    y += stepy; 
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
