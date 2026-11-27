class Player {
  //booleans
  boolean jump = false;
  boolean dodge = false;
  boolean left = false;
  boolean right = false;
  boolean slash = false;
  boolean kick = false;
  boolean special = false;
  boolean isJumping = false;

  //int
  int s = 50;

  //PVector (pos, velocity, gravity)
  PVector p; //position
  PVector v; //velocity
  PVector a; //acceleration / gravity
  Player() {
    v = new PVector(3, 0);
    a = new PVector(0, 0.32);
    p = new PVector(350, 250);
  }
  void display() {
    v.y += a.y;
    p.y += v.y;
    landedCheck();
    ellipse(p.x, p.y, 50, s);
  }
  void jump() {
    if (jump) {
      jump = false;
      isJumping = true;
      v.y = -10;
      a.y = 0.32;
    }
  }
  void landedCheck() {
    if (p.y >= 400) {
      p.y = 400;
      v.y = 0;
      a.y = 0;
      isJumping = false;
      jump = true;
    }
  }
  void move() {
    if (left) {
      p.x -= v.x;
    } else if (right) {
      p.x += v.x;
    } else if (dodge) {
      s= 25;
    } else if (!dodge) {
      s = 50;
    }
  }
}
