class Line {
  PVector p0;
  PVector p1;

  Line(PVector p0, PVector p1) {
    this.p0 = p0;
    this.p1 = p1;
  }

  void display() {
    line(p0.x, p0.y, p1.x, p1.y);
  }
}
