boolean render = true;
int nFrames = 84;
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
    
    float d = dist(position.x, position.y, width / 2.0, height / 2.0);
    angle += sin(foo * 3) * TAU;
    //angle += (sin(foo * 2 + d / 16.0) * 0.5 + 1)* TAU;
    //angle += sin(d / 1.0) * 0.1;
    //angle += size * 1.1 * TAU;
    
    PVector p0 = PVector.fromAngle(angle);
    p0.mult(distance);
    PVector p1 = PVector.fromAngle(angle + TWO_PI / 3.0);
    p1.mult(distance);
    PVector p2 = PVector.fromAngle(angle + 2 * TWO_PI / 3.0);
    p2.mult(distance);

    pushStyle();
    colorMode(HSB);
    float cOffset = 0;
    color c0 = color(cOffset % 256, 255, 255);
    color c1 = color((256 / 3 + cOffset) % 256, 255, 255);
    color c2 = color((2 * 256 / 3 + cOffset) % 256, 255, 255);

    float c = 0;
    c0 = color(c, 224, 255);
    c1 = color(c + 10, 224, 255);
    c2 = color(c - 10, 224, 255);
    
        
    //vertex(position.x + p0.x, position.y + p0.y);
    
    noStroke();
    fill(c0);
    ellipse(position.x + p0.x, position.y + p0.y, size, size);
    fill(c1);
    ellipse(position.x + p1.x, position.y + p1.y, size, size);
    fill(c2);
    ellipse(position.x + p2.x, position.y + p2.y, size, size);
    popStyle();
  }
  
}

void settings() {
  size(1280, 720, P2D);
};

void setup() {
  dots = new DisplayableList();
  float d = 0.5;
  float a = 0;
  while (d < 1000) {

    PVector position = PVector.fromAngle(a);
    position.mult(d);
    position.add(new PVector(width / 2.0, height / 2.0));

    float size = map(d, 0, 350, 0.5, 5);
    float distance = map(d, 0, 350, 0, 120);
    float offset = a;
    Dot dot = new Dot(position, size, distance, offset);
    dots.add(dot);
    float m = 6;
    d *= 1 + (0.00025 * m);
    a += 0.00245 * m;
    //d += 0.5;
    //a += 1;
  }
}

void draw() {
  blendMode(BLEND);
  background(0);
  //radialGradient(color(0, 32, 48), 0);
  blendMode(ADD);
  dots.update();
  
  stroke(255);
  noFill();
  beginShape();
  dots.display();
  endShape();
  
  filter(BLUR, 5);
  dots.display();
  
  phase += phaseInc;
  phase -= (int) phase;
  if (render) {
      saveFrame("./tiff/######.tiff");
    if (frameCount == nFrames * 4) {
      exit();
    }
  }
}