ArrayList<Face> faceList = new ArrayList<Face>();

int nFrames = 64;
float phase = 0.0;
float phaseInc = 1.0 / (float) nFrames;
color c0 = color(255, 128, 32);
color c1 = color(255, 32, 255);

class Face {
  float x;
  float y;
  float s;
  color c;
  float offset = 0;
  float yOffset = 0;

  Face(float x, float y, float s, color c) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.c = c;
    offset = ((int) random(nFrames)) / (float) nFrames;
    //offset = x / (float) width;
    yOffset = x / (float) width;
    //yOffset = random(1.0);
  }

  void draw() {
    pushMatrix();
    pushStyle();
    translate(x, y + sin((yOffset + phase) * TAU) * 180 * s);
    scale(s);
    //float h = hue(c);
    //fill((h + phase * 256) % 256, 256, 256, 192);
    fill(c, 192);
    ellipse(0, 0, 500, 500);
    fill(255);
    ellipse(-100, 0, 100, 200);
    ellipse(100, 0, 100, 200);
    fill(0);
    ellipse(-100, 0, 100, 100);
    ellipse(100, 0, 100, 100);
    arc(0, 120, 250, 200, 0, PI);
    popStyle();
    popMatrix();
  }
}

void settings() {
  size(1280, 720);
  //pixelDensity(displayDensity());
  randomSeed(0);
}

void setup() {
  //blendMode(ADD);
  //colorMode(HSB);

  for (int i = 0; i < 200; i++) {
    float x = random(width);
    float y = random(height);
    float s = random(0.1, 0.25);
    //color c = color(random(256), 256, 256, 192);
    color c = lerpColor(c0, c1, random(1));
    if (random(1.0) < 0.5) {
      c = c0;
    } else {
      c = c1;
    }
    //color c = c0;
    faceList.add(new Face(x, y, s, c));
  }
}

void draw() {
  background(0);
  for (Face face : faceList) {
    face.draw();
  }
  
  phase += phaseInc;
  phase -= (int) phase;
  
  //saveFrame("./tiff/f######.tiff");
  //if (frameCount == nFrames * 4) {
  //  exit();
  //}
}