Particle[] goob = new Particle[30];

void setup() {
  size(600, 400);
  // make particles, first one is Oddball
  for (int i = 0; i < goob.length; i++) {
    if (i == 0) {
      goob[i] = new OddballParticle();
    } else {
      goob[i] = new Particle();
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < goob.length; i++) {
    goob[i].move();
    goob[i].show();
  }
}
class Particle {
  // member variables
  private double x, y, angle, speed;
  private color col;

  // constructor
  Particle() {
    x = width / 2.0;
    y = height / 2.0;
    angle = random(TWO_PI);
    speed = random(1, 3);
    col = color(random(255), random(255), random(255));
  }

  // move the particle
  void move() {
    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;

    // wrap around the edges
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  // draw the particle
  void show() {
    fill(col);
    noStroke();
    ellipse((float)x, (float)y, 10, 10);
  }

  // getters and setters
  double getX() { return x; }
  double getY() { return y; }
  color getColor() { return col; }
  double getAngle() { return angle; }
  double getSpeed() { return speed; }

  void setColor(color c) { col = c; }
  void setAngle(double a) { angle = a; }
  void setSpeed(double s) { speed = s; }
}
class OddballParticle extends Particle {
  OddballParticle() {
    super();
    setColor(color(125, 125, 125)); 
    setSpeed(4);
  }

  void move() {
    // spaceship wiggles slightly
    setAngle(getAngle() + random(-0.1, 0.1));
    super.move();
  }

  void show() {
    pushMatrix(); // save drawing position
    translate((float)getX(), (float)getY());
    rotate((float)getAngle()); // rotate to face direction

    fill(getColor());
    noStroke();

    // draw a simple triangle spaceship
    beginShape();
    vertex(0, -10);   // nose
    vertex(-6, 6);    // left fin
    vertex(6, 6);     // right fin
    endShape(CLOSE);

    popMatrix(); // restore drawing position
  }
}
