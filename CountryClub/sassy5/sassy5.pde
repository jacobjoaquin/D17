boolean captureFrames = true;
int nFrames = 80;
float phase = 0.0;
float phaseInc = 1 / (float) nFrames;
float nArcs = 8;
float dInc = 6;
float dStart = 1;
float arcRatio = 2;

color c1 = color(255, 32, 128);
color c0 = color(255, 128, 32);

void settings() {
  size(1280, 720, P2D);
}

void setup() {
  rectMode(CENTER);
  noStroke();
  strokeWeight(8);
  noFill();
  strokeCap(SQUARE);
  blendMode(ADD);
}

void draw() {
  background(8);

  float d = dStart;
  float unit = 1 / (float) nArcs;
  float counter = 0;

  pushMatrix();
  translate(width / 2.0, height / 2.0);

  float outerPhase = 1 - phase;
  while (d < height) {
    for (int i = 0; i < nArcs; i++) {
      float innerPhase = outerPhase + i;
      pushMatrix();
      float n = i * unit;
      float a = n * TAU;

      rotate(a);
      stroke(c0);
      strokeWeight(d * 0.005);
      if (counter % 2 == 0) {
        rotate(unit * TAU * 0.25);
        innerPhase += 0.5;
        stroke(c1);
      }
      float totalPhase = phase + innerPhase + outerPhase;
      while (totalPhase > 1) {
        totalPhase -= 1;
      }
      float a1 = map(sin(TAU * totalPhase), -1, 1, 0, 1) * unit * arcRatio;
      a1 = max(a1, 0.01);
      arc(0, 0, d, d, -a1, a1);
      popMatrix();
      innerPhase += n;
    }  
    //d += dInc;
    d *= 1.0125;
    counter++;
    outerPhase += unit * 0.06125;
  }
  popMatrix();

  //filter(BLUR, 1);

  phase += phaseInc;
  phase -= (int) phase;

  saveFrame("./frames/######.tiff");
  if (captureFrames) {
    if (frameCount == nFrames * 4) {
      exit();
    }
  }
}