class Circle {
  float x;
  float y;
  float diameter;
  float drawRatio = 1.0;
  Style style = new Style();

  Circle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  Circle (PVector p, float diameter) {
    this(p.x, p.y, diameter);
  }

  float distToCircle(Circle c) {
    return dist(x, y, c.x, c.y) - diameter * 0.5 - c.diameter * 0.5;
  }

  void display() {
    style.begin();
    float d = diameter;
    ellipse(x, y, d * drawRatio, d * drawRatio);
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
    PVector p;
    boolean isInCircle = false;
    do {
      float s = width / 2.0;
      p = new PVector(random(-s, s), random(-s, s));
      float d = dist(p.x, p.y, 0, 0);
      isInCircle = d < width / 2.0;
    } while(!isInCircle);

    float x = p.x;
    float y = p.y;
    float diameter = random(minSize, maxSize);

    // Get nearest
    PVector closestPoint = new PVector();
    float closestDistance = Float.MAX_VALUE;
    float closestAngle = 0;

    for (Circle c : circleList) {
      float d = dist(x, y, c.x, c.y) - diameter / 2.0 - c.diameter / 2.0;
      if (d < closestDistance) {
        closestDistance = d;
      }
    }
    // Create Circle
    if (closestDistance >= minSize) {
      diameter = random(minSize, maxSize);
      if (letterD.containsPoint(x, y) || letter17.containsPoint(x, y)) {
        diameter = random(minSize, minSize * 1.2);
        diameter = minSize;
      }
      diameter = min(diameter, closestDistance);
      Circle circle = new Circle(x, y, diameter);

      // Set Style
      Style style = new Style();
      style.doStroke = false;
      circle.style = style;
      circle.drawRatio = 1.85;

      circleList.add(circle);
      tryCount = 0;
    }
  } while (tryCount < nTries);
}
