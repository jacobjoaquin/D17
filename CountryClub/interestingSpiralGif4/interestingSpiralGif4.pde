float t = 0.0;
float d = 0.01;
float a = 0.0;
float boundary;

void setup() {
  size(1280, 720, P2D);
  noStroke();
  boundary = sqrt(2) * width / 2.0;
  frameRate(16);
}

void draw() {
  colorMode(RGB);
  //blendMode(BLEND);
  background(0);
  pushMatrix();
  translate(width / 2, height / 2);
  //scale(1);

  float offset = 0.0;
  float tOffset = 0.2;
  //colorMode(HSB);
  color c0 = color(245, 255, 255);
  color c1 = color(255, 32, 128);

  //blendMode(ADD);
  //doRibbon(a - offset, t - tOffset, c0);
  doRibbon(a, t, c1);
  //filter(BLUR, 3);
  //doRibbon(a - offset, t - tOffset, c0);
  //doRibbon(a, t, c1);

  a += PI / 64.0;
  t += 1 / 4.0;
  popMatrix();

  // Save frames
  //if (true) {
  //  if (frameCount % 2 == 0 || true) {
  //  }
  saveFrame("tiff/######.tiff");
  if (frameCount == 64 * 4) {
    exit();
  }
  //}
}

void doRibbon(float thisAngle, float thisTime, color c) {
  float d = 0.01;

  beginShape(TRIANGLE_STRIP);
  fill(c);
  while (d < boundary) {
    float x = sin(thisAngle);
    float y = cos(thisAngle);
    PVector p = new PVector(x, y);
    p.mult(d + d * sin(thisTime * PI / 2.0) * 0.125);
    float x2 = sin(thisAngle + PI / 3.0);
    float y2 = cos(thisAngle + PI / 3.0);
    PVector p2 = new PVector(x2, y2);
    p2.mult(map(d, 0, boundary, 1, 80));
    p2.add(p);
    vertex(p.x, p.y);
    vertex(p2.x, p2.y);
    thisAngle += map(d, 0, boundary, PI / -24, PI / 10);
    d *= 1.0085;
    thisTime += 0.12 + d * 0.0005;
  }
  endShape();
}