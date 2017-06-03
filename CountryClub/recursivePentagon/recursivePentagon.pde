int nPoints =5;
int nSpawns = 1000;
float theSize;
int scale = 1;

int nFrames = 100;
float phase = 0.0;
float phaseInc = 1 / (float) nFrames;

void settings() {
  size(1280 * scale, 720 * scale, P2D);  
}


void setup() {
  blendMode(ADD);
  noFill();
  stroke(255);
  theSize = width;
  frameRate(30);
}

float foo = 0;
void draw() {
  background(0);
  translate(width / 2.0, height / 2.0);
  rotate(-PI * 0.1);
  RecShape shape = new RecShape();
  for (int i = 0; i < nPoints; i++) {
    float n = i / (float) nPoints;
    PVector p = PVector.fromAngle(n * TAU + PI / 6.0);
    p.mult(720 / 2.1);
    //p.add(width / 2.0, height / 2.0);
    shape.add(p);
  }

  shape.display();
  
  float nPhase = phase;
  for (int i = 0; i < nSpawns; i++) {
   RecShape shape2 = shape.spawn(1 - nPhase);
   nPhase += 0.04;
   nPhase -= (int) nPhase;
   shape2.display();
   shape = shape2;
  }

  phase += phaseInc;
  phase -= (int) phase;
  
  saveFrame("tiff/f######.tiff");
  if (frameCount == nFrames * 4) {
  exit();
  }
}