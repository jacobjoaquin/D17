int nFrames = 128;
float phase = 0.0;
float phaseInc = 1.0 / (float) nFrames;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(0);
  stroke(255);
  blendMode(ADD);
  for (int i = 0; i < 200; i++) {
    point(random(width), random(height), random(-width, width));
  }
  
  translate(width / 2.0, height - 10);
  //translate(0, 0, -500);
  //rotateX(map(mouseX, 0, width, 0, TAU));
  rotateX(map(204, 0, width, 0, TAU));
  //dotRing(128, 100);
  
  int nRings = 160;
  for (int i = 0; i < nRings; i++) {
    pushMatrix();
    float offset = (float) i / (float) nRings;
    float t = i * 8 - 100;
    float s = sin((offset + (1 - phase)) * TAU * 3) + 1;
    translate(0, 0, t);
    stroke((1 - offset) * 255);
    translate(random(-10, 10) * s, 0);
    dotRing((int) random(64, 128), 60 * s * (1 - offset));
    popMatrix();
  }
  
  phase += phaseInc;
  if (phase > 0) {
    phase -= 1.0;
  }
  

  saveFrame("./tiff/f######.tiff");
  if (frameCount == nFrames) {
    exit();
  }
}

void dotRing(int nDots, float s) {
  for (int i = 0; i < nDots; i++) {
    float angle = (float) i / (float) nDots * TAU;
    PVector p = PVector.fromAngle(angle).mult(s);
    
    point(p.x, p.y, 0);
    
  }
}