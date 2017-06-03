int nFrames = 64 * 3;
float phaseInc = 1.0 / (float) nFrames;
float phase = 0.0;

void settings() {
  size(1280, 720, P2D);
  //pixelDensity(displayDensity());
}

void setup() {
}

void draw() {
  //noLoop();
  translate(width / 2.0, height / 2.0);
  background(0);
  
  stroke(255, 32, 192, 248);
  strokeWeight(3);
  noFill();
  blendMode(BLEND);
  doIt();
  filter(BLUR, 3);
  stroke(255, 64);
  blendMode(ADD);
  strokeWeight(1);
  doIt();
  phase += phaseInc;
  
  saveFrame("./frames/#####.tiff");
  if (frameCount == nFrames) {
    exit();
  }
}


void doIt() {
  
  float d = 0;
  float a = 0;
  
  beginShape();
  float thisPhase = phase;
  while (d < 750) {
    float v = sin(thisPhase * TAU) * 30;
    PVector p = PVector.fromAngle(a).mult(d + v);
    vertex(p.x, p.y);
    float aAmount = TAU / 360.0 + (sin((1 - phase) * TAU + d * 0.015) * 0.5 + 0.5) * 0.0005 + 0.00025;
    float dAmount = 0.05;
    aAmount *= 0.5;
    dAmount *= 0.25;
    a += aAmount;
    d += dAmount;
    thisPhase += 0.01;
  }
  endShape();

}