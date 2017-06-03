int nFrames = 128;
//int nFrames = 128;

Phasor phasor = new Phasor(1.0 / float(nFrames));

class Phasor {
  float inc = 0.0;
  float phase = 0.0;

  Phasor() {
    this(0, 0);
  }

  Phasor(float inc) {
    this(inc, 0);
  }

  Phasor(float inc, float phase) {
    this.inc = inc;
    this.phase = phase;
  }

  void update() {
    phase += inc;
    while (phase >= 1.0) {
      phase -= 1.0;
    }
    while (phase < 0.0) {
      phase += 1.0;
    }
  }

  float radians() {
    return phase * TWO_PI;
  }

  float sine() {
    return sin(phase * TWO_PI);
  }
}

void setup() {
  size(1280, 720, P3D);
  strokeWeight(1);
  stroke(255, 32, 255);
  //  noFill();
  fill(0);
  noStroke();
  stroke(255);
  strokeWeight(1.5);
}

void draw() {
  //  background(64, 32, 64);
  background(0);

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  doThing();
  popMatrix();
  //pushMatrix();
  //translate(0, height);
  //doThing();
  //popMatrix();
  //pushMatrix();
  //translate(width, 0);
  //doThing();
  //popMatrix();
  //pushMatrix();
  //translate(width, height);
  //doThing();
  //popMatrix();

  phasor.update();

  saveFrame("./tiff/######.tiff");
  if (frameCount == nFrames * 3) {
    exit();
  }
}

void doThing() {
  //  float lookX = map(sin(phasor.phase * TWO_PI + PI / 2.0), -1, 1, -100, 100);
  //  float lookY = map(sin(phasor.phase * TWO_PI + PI / 6.0), -1, 1, -100, 100);
  //  camera(width / 2.0 + lookX, height / 2.0 + lookY, (height/2.0) / tan(PI*30.0 / 180.0),
  //         width / 2.0, height / 2.0, 0,
  //         0, 1, 0);
  //  translate(width / 2.0, height / 2.0);

  //  float rAmt = 0.1;
  //  translate(width * rAmt * phasor.sine(),
  //            height * -rAmt * sin(phasor.phase * TWO_PI + PI / 2.0));

  float s = 16;
  float d = (s * 40) + 0;
  float a = 0;
  float angleUpdate = PI / 8.0;

  while (d > -10000) {
    PVector p = PVector.fromAngle(a);
    p.mult(width / 2.5);

    pushMatrix();
    float offset = d + s * 16 * phasor.phase;
    translate(p.x, p.y, offset);
    //    rotate(TWO_PI, 0.5, 1, 1);

    //    float d2 = dist(0, 0, -200, p.x, p.y, offset) * 0.006125;
    //    rotateX(phasor.phase * TWO_PI + d2);
    //    rotateY(phasor.phase * TWO_PI + d2);
    //    rotateZ(phasor.phase * TWO_PI + d2);

    //    box(s * 1.5);

    box(s * 4, s * 1, s * 9);
    popMatrix();

    d -= s * 1;
    a += angleUpdate;
  }
}