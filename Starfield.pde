//your code here
SpinThings spots;

// Array of stars
Star[] stars = new Star[400];
void setup() {
  //your code here
  size(1000, 1000);
  smooth();
  stroke(255);
  strokeWeight(5);

  spots = new SpinThings(width/2, height/2, -0.02, 90.0);

  // In it, all stars
  for (int i=0; i<stars.length; i++) 
    stars[i] = new Star();
}

void draw() {
  //your code here
  background(0);
  translate(width/2, height/2);
  
  // Update and draw all stars
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].draw();
  }
  spots.spin();
  spots.show();

}

class Star {
  //your code here
  // Star coordinates in 3D
  float x;
  float y;
  float z;
  int myColor;
  
  Star() {
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = random(0, 2000);
  }
  
  void update() {
    z-=10;        // Move star closer
    if (z <= 0.0) // Reset star pos to center
      reset();
  }
  
  void reset() {
    // Reset star to a position far away
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = 2000.0;
  }

  void draw() {
    // create offset and scaling
    float offsetX = 100.0*(x/z);
    float offsetY = 100.0*(y/z);
    float scaleZ = 0.0001*(2000.0-z);

    // Draw star
    pushMatrix();
    translate(offsetX, offsetY);
    scale(scaleZ);
    fill ((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    ellipse(0,0,20,20);
    popMatrix();
  }
}

class Spin {
  float x, y, speed;
  float angle = 0.0;
  Spin(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
  }
  void spin() {
    angle += speed;
  }
}
class SpinThings extends Spin { //inherits from Particle
  float dim;
  SpinThings(float x, float y, float s, float d) {
    super(x, y, s);
    dim = d;
  }
  void show() {
    noStroke();
    pushMatrix();
    translate(x/20, y/12);
    angle += speed;
    rotate(angle);
    ellipse(-dim/2, 0, 25, 25);
    ellipse(dim/2, 0, 25, 25);
    popMatrix();
  }
}
