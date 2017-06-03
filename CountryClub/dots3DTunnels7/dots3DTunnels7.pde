boolean render = false;
int nFrames = 42;
float phase = 0.0;
float phaseInc = 1 / (float) nFrames;

DisplayableList dots;

class Dot extends DisplayableBase {
  PVector position;
  float size;
  float distance;
  float offset;

  Dot(PVector position, float size, float distance, float offset) {
    this.position = position;
    this.size = size;
    this.distance = distance;
    this.offset = offset;
  }

  void display() {
    float angle = phase * TAU;
    float foo = atan2(position.y - height / 2.0, position.x - width / 2.0);
    angle += (sin(foo * 6) * 0.5 + 1) * TAU;

    PVector p0 = PVector.fromAngle(angle);
    p0.mult(distance);
    vertex(position.x + p0.x, position.y + p0.y);
  }
}

void settings() {
  size(500, 500, P2D);
};

void setup() {
  dots = new DisplayableList();
  float d = 0.5;
  float a = 0;
  while (d < 390) {

    PVector position = PVector.fromAngle(a);
    position.mult(d);
    position.add(new PVector(width / 2.0, height / 2.0));

    float size = map(d, 0, 350, 0.1, 5);
    float distance = map(d, 0, 350, 0, 30);
    float offset = a;
    Dot dot = new Dot(position, size, distance, offset);
    dots.add(dot);
    d *= 1.0015;
    a += 0.035;
  }
}

void draw() {
  blendMode(BLEND);
  background(8);
  blendMode(ADD);
  dots.update();


  color c0;
  color c1;
  color c2;
  float offset = 3;

  pushStyle();
  colorMode(HSB);
  c0 = color(16, 128, 255);
  c1 = color(230, 255, 255);
  c2 = color(128, 180, 255);

  noFill();
  stroke(c0);
  beginShape();
  dots.display();
  endShape();
  pushMatrix();
  translate(-offset, 0);
  stroke(c1);
  beginShape();
  dots.display();
  endShape();
  popMatrix();
  pushMatrix();
  translate(offset, 0);
  stroke(c2);
  beginShape();
  dots.display();
  endShape();
  popMatrix();
  popStyle();

  filter(BLUR, 5);
  dots.display();

  pushStyle();
  noFill();
  stroke(c0);
  beginShape();
  dots.display();
  endShape();
  pushMatrix();
  translate(-offset, 0);
  stroke(c1);
  beginShape();
  dots.display();
  endShape();
  popMatrix();
  pushMatrix();
  translate(offset, 0);
  stroke(c2);
  beginShape();
  dots.display();
  endShape();
  popMatrix();
  popStyle();

  phase += phaseInc;
  phase -= (int) phase;
  
  if (render) {
    saveFrame("./tiff/f######.tiff");
    if (frameCount == nFrames) {
      exit();
    }
  }
}