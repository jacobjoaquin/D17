int nFrames = 32;
float phase = 0.0;
float phaseInc = 1.0 / (float) nFrames;

float xOffset = 100;
float yOffset = 1000;
float zOffset = 2000;

boolean isFinal = false;

void settings() {
  size(1024, 576, P2D);
  //pixelDensity(displayDensity());
}

void setup() {
}

void draw() {
  background(0);
  noFill();

  //strokeWeight(2);
  //blendMode(ADD);
  float offsetInc = 0.1;
  float m = 0.98;
  int nSeed = 5;
  float inc = 1;
  float s = height * 5;
  noiseSeed(nSeed);

  //colorMode(HSB);
  float h = 0;
  int counter = 0;
  int nDots = 256;
  stroke(255, 96);
  strokeWeight(2);
  float thisZOffset = zOffset;

  while (s > 0.5) {
    color c0 = color(255, 128);
    color c1 = color(255, 128, 32, 128);
    color c2 = color(255, 32, 192, 128);
    //color c1 = color(255, 128, 16, 192);
    //color c2 = color(255, 16, 255, 192);
    pushMatrix();

    translate(width / 2.0, height / 2.0);
    beginShape();
    for (int i = 0; i < nDots; i++) {
      float nz = noise(thisZOffset);
      thisZOffset += 0.005;
      //float a = (nz + i / (float) nDots) * TAU;
      float r = i / (float) nDots;
      r += nz * 1.0 / (float) nDots * 2;
      float x = sin(r * TWO_PI);
      float y = cos(r * TWO_PI);
      float n = (noise(xOffset + x * inc, yOffset + y * inc) - 0.0) * s;
      //PVector p = PVector.fromAngle(a).mult(n);
      PVector p = new PVector(x, y).mult(n);

      color ct = lerpColor(c1, c2, sin(i / (float) nDots * TAU * 6) * 0.5 + 0.5);
      color cm = lerpColor(c0, ct, min(707, s / (float) width));
      stroke(cm);

      //point(p.x, p.y);
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
    popMatrix();

    //xOffset += offsetInc;
    //yOffset += offsetInc;

    xOffset = sin((counter / (float) nFrames + phase) * TAU) * offsetInc;
    yOffset = cos((counter / (float) nFrames + phase) * TAU) * offsetInc;
    //zOffset = cos((counter / (float) nFrames + phase) * TAU) * offsetInc;
    //zOffset = cos((counter / (float) nFrames + phase) * TAU) * offsetInc;
    zOffset += 0.01;

    counter++;

    s *= m;
  }

  phase += phaseInc;

  //noLoop();
  //saveFrame("./tiff/f######.tiff");

  if (isFinal) {
    saveFrame("./mov/######.png");
    if (frameCount == nFrames) {
      exit();
    }
  }
  //save("perlinPlasma_" + nSeed + ".tiff");
}