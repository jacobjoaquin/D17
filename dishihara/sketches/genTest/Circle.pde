class Circle {
  float x;
  float y;
  float diameter;
  Style style = new Style();

  Circle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  Circle (PVector p, float diameter) {
    this(p.x, p.y, diameter);
  }

  void display() {
    style.begin();
    float d = diameter;
    ellipse(x, y, d, d);
    style.end();
  }
}

void circleFill(ArrayList<Circle> circleList) {
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
      if (letterDSmall.containsPoint(x, y, diameter * 0.125)) {
        style.fillColor = chooseColor(pink, pink2);
      }
      style.doStroke = false;
      circle.style = style;

      circleList.add(circle);
      tryCount = 0;
    }
  } while (tryCount< nTries);
}
