boolean render = false;
int nFrames = 256;
float phase = 0.0;
float phaseInc = 1.0 / (float) nFrames;

void settings() {
  size(1280, 720, P2D);
}

void setup() {
  colorMode(HSB);
}

void draw() {
  background(0);
  //noLoop();
  noStroke();
  drawThing(width / 2.0, height / 2.0, 1800, 50, 3 * TWO_PI / 360.0);
  
  phase += phaseInc;
  if (phase >= 1.0) {
    phase -= 1.0;
  }
  //save("opticalEffect2.tiff");
  //exit();
}

void drawThing(float x, float y, float s, float shrink, float r) {
  float c = 0;
  boolean b = true;
  pushMatrix();
  translate(x, y);

  while (s > 0) {
    //c = b ? 0 : 128;
    //b = !b;
    c += phase * 256;
    c %= 256;
    
    for (int i = 0; i < shrink; i++) {
      //fill(c + (float) i / (float) shrink * 128.0);
      float v = (float) i / (float) (shrink - 1) * 32.0;
      //v = v % 256;
      //println(c + v);
      fill((c + v) % 256, 128, 255);
      //fill(c + v);
      ellipse(0, 0, s, s * 0.617);
      s -= 1;
    }
    rotate(r);
    translate(0, s * 0.001);
    //s -= shrink;
  }
  popMatrix();
}