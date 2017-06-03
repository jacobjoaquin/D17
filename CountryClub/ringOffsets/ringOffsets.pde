Phasor phasor;
boolean renderFrames = false;
int nFrames = 36;

void setup() {
  size(500, 500, P2D);
  //pixelDensity(displayDensity());

  phasor = new Phasor(1.0 / (float) nFrames);
}

void draw() {
  pushMatrix();
  translate(width / 2, height / 2);

  float s = 350;
  float m = 0.9;
  float offset = 0;
  while (s >= 1) {
    float sNext = s * m;
    ring(s, sNext, offset + phasor.phase * TWO_PI, color(255, 0, 128), color(0, 255, 0));
    s = sNext;
    offset += TWO_PI / 6.66;
  }
  popMatrix();

  phasor.update();

  if (renderFrames) {
    saveFrame("./gif/f######.gif");
    if (frameCount >= nFrames) {
      exit();
    }
  }
}

void ring(float r0, float r1, float offset, color c0, color c1) {
  pushStyle();
  noStroke();
  beginShape(TRIANGLE_STRIP);
  int resolution = 100;
  for (int i = 0; i < resolution + 1; i++) {
    float n = i / (float) resolution;
    float a = n * TWO_PI + offset;

    PVector p0 = PVector.fromAngle(a);
    PVector p1 = p0.copy().mult(r1);
    p0.mult(r0);

    fill(lerpColor(c0, c1, n));

    vertex(p0.x, p0.y);
    vertex(p1.x, p1.y);
  }
  endShape(CLOSE);
  popStyle();
}