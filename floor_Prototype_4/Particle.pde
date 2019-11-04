class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float locX;
  float locY;
  float velocityLimit;
  float mouseDistance;
  int red = (int)random(200, 255);
  int green = (int)random(200, 255);
  int blue = (int)random(200, 255);

  Particle( float locX, float locY) {
    this.locX = locX;
    this.locY = locY;
    location = new PVector(locX, locY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(velocityLimit);
  }

  void velocity() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector stop = new PVector(0, 0);
    mouse.sub(location);
    mouse.setMag(0.1);
    
    mouseDistance = dist(mouseX, mouseY, location.x, location.y);
    if (mouseDistance < 100) {
      acceleration = mouse;
      velocityLimit = 6;
    } else if (mouseDistance < 150) {
      acceleration = mouse;
      velocityLimit = 4;
    } else if (mouseDistance < 200) {
      acceleration = mouse;
      velocityLimit = 3;
    } else if (mouseDistance < 250) {
      acceleration = mouse;
      velocityLimit = 2;
    } else if (mouseDistance < 300) {
      acceleration = mouse;
      velocityLimit = 1.5;
    } else if (mouseDistance < 350) {
      acceleration = mouse;
      velocityLimit = 1;
    } else if (mouseDistance < 400) {
      acceleration = mouse;
      velocityLimit = .5;
    } else if (mouseDistance < 450) {
      acceleration = mouse;
      velocityLimit =.25;
    } else {
      acceleration = stop;
      velocityLimit = 0;
    }
  }

  void scatter() {
    location.x += (int)random(-50, 50);
    location.y += (int)random(-50, 50);
  }

  void display() {
    fill(255);
    circle(location.x, location.y, 5);
  }
}
