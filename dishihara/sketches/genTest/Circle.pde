class Circle {
  float x;
  float y;
  float diameter;
  Style style = new Style();

  Circle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  Circle (PVector p, float diameter) {
    this(p.x, p.y, diameter);
  }

  void display() {
    style.begin();
    float d = diameter;
    ellipse(x, y, d, d);
    style.end();
  }
}
