/**
 * Exercise 0.3
 * 
 * Create a random walker with dynamic probabilities.
 * For example, can you give it a 50 percent chance of moving 
 * in the direction of the mouse?
 * Remember, you can use mouseX and mouseY to get
 * the current mouse position in p5.js!
 */
 
class Walker {
  int x;
  int y;
  Walker() {
    x = width/2;
    y = height/2;
  }
  void display() {
    stroke(0);
    point(x, y);
  }

  void step() {
    float choice = random(0, 1);
    if (choice < 0.5) {
      x += random(-1, 1);
      y += random(-1, 1);
    } else {
      x += x < mouseX ? 1 : -1;
      y += y < mouseY ? 1 : -1;
    }
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
