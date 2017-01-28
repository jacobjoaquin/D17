// DIShihara Generation Test

float minSize = 4;
float maxSize = 24;
int nTries = 1000;
ArrayList<Circle> circleList;

LetterDSmall letterDSmall;

color orange = color(255, 128, 0);
color orange2 = color(255, 192, 64);
color pink = color(251, 65, 236);
color pink2 = color(250, 146, 231);

void settings() {
  size(500, 500, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  randomSeed(2017);
  PVector center = new PVector(width / 2.0, height / 2.0);
  circleList = new ArrayList<Circle>();
  // noFill();

  // Create Disorient "D" Goes Here
  letterDSmall = new LetterDSmall(center, width * 0.6);
  // letterDSmall.setCircleRatio(0.9);
  // for (Circle c : letterDSmall.toCircleList()) {
  //   // c.style.doFill = false;
  //   c.style.doStroke = false;
  //   c.style.fillColor = chooseColor(pink, pink2);
  //   circleList.add(c);
  // }
  // circleList.addAll(letterDSmall.toCircleList());

  // Create other circles
  int tryCount = 0;
  do {
    float thisSize = maxSize;
    tryCount++;

    // Create circle
    PVector p = PVector.fromAngle(random(TAU));
    p.mult(random(width / 2.0 - maxSize));
    p.add(width / 2.0, height / 2.0);
    float x = p.x;
    float y = p.y;
    float diameter = width;

    // Get nearest
    float d = width;
    float overlapRatio = 1.0;
    for (Circle c : circleList) {
      float thisD = dist(x, y, c.x, c.y) - c.diameter * 0.5 * overlapRatio;
      if (thisD < d) {
        d = thisD;
      }
    }

    if (d >= minSize) {
      diameter = min(d * 2, random(minSize, maxSize));
      diameter = min(diameter, maxSize);
      Circle circle = new Circle(x, y, diameter);

      // Set Style
      Style style = new Style();
      style.fillColor = chooseColor(orange, orange2);
      if (letterDSmall.containsPoint(x, y, diameter * 0.25)) {
        style.fillColor = random(1.0) < 0.5 ? pink : pink2;
      }
      style.doStroke = false;
      circle.style = style;

      circleList.add(circle);
      tryCount = 0;
    }
  } while (tryCount< nTries);


  // for (Circle c : letterDSmall.toCircleList()) {
  //   // c.style.doFill = false;
  //   c.style.doStroke = false;
  //   c.style.fillColor = pink;
  //   circleList.add(c);
  // }

  // Sort
  // ArrayList<Circle> sorted = new ArrayList<Circle>();
  //
  // Circle c = circleList.remove(0);
  // sorted.add(c);
  //
  // while (circleList.size() > 0) {
  //   float distance = width;
  //   int index = 0;
  //   for (int i = 0; i < circleList.size(); i++) {
  //     Circle c1 = (Circle) circleList.get(i);
  //     float d = dist(c.x, c.y, c1.x, c1.y);
  //     if (d < distance) {
  //       index = i;
  //       distance = d;
  //     }
  //   }
  //   c = circleList.remove(index);
  //   sorted.add(c);
  // }
  //
  // circleList = sorted;
}

int f = 0;

void draw() {
  background(0);
  noLoop();
  for (Circle c : circleList) {
    c.display();
  }

  save("./output/latest.png");
}
