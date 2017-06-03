void settings() {
  size(800, 400, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  noLoop();
  background(255);
  int nBars = 25;
  strokeWeight(3);
  translate(width / 2.0, 390);
  for (int i = 0; i < nBars; i++) {
    float angle = (float) -i / (float) (nBars - 1) * PI;
    PVector p = PVector.fromAngle(angle);
    PVector p2 = p.copy().mult(width * 0.035);
    p.mult(width * 0.45);
    line(p2.x, p2.y, p.x, p.y);
  }
  
  save("heliosImage.png");
}