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
    PVector p = PVector.fromAngle(random(TAU));
    p.mult(random(width / 2.0 - maxSize));
    // p.add(width / 2.0, height / 2.0);
    float x = p.x;
    float y = p.y;
    float diameter = width;

    // Get nearest
    PVector closestPoint = new PVector();
    float closestDistance = Float.MAX_VALUE;
    float closestAngle = 0;

    for (Circle c : circleList) {
      float d = dist(x, y, c.x, c.y) - c.diameter * 0.5;
      if (d < closestDistance) {
        closestAngle = atan2(c.y - y, c.x - x);
        PVector tangent = PVector.fromAngle(closestAngle + PI).mult(c.diameter * 0.5);
        closestDistance = d;
        closestPoint.set(c.x, c.y).add(tangent);
      }
    }

    // lineList distance
    // PVector nearest = vectorGraphic.getClosestPoint(x, y);
    // float d = dist(nearest.x, nearest.y, x, y);
    // if (d < closestDistance) {
    //   closestAngle = atan2(nearest.y - y, nearest.x - x);
    //   closestDistance = d;
    //   closestPoint.set(nearest.x, nearest.y);
    // }

    // Create Circle
    if (closestDistance >= minSize) {
      // Debug
      // if (closestDistance < maxSize * 2) {
      //   ellipse(closestPoint.x, closestPoint.y, 5, 5);
      //   line(x, y, closestPoint.x, closestPoint.y);
      // }

      diameter = random(minSize, maxSize);
      diameter = min(diameter, closestDistance * 2);
      Circle circle = new Circle(x, y, diameter);

      // Move to closestPoint
      if (circleList.size() > 0) {
        // Move circle
        if (closestDistance > 0 && closestDistance < maxSize * 2) {
          PVector move = PVector.fromAngle(closestAngle).mult(closestDistance - diameter * 0.5);
          circle.x += move.x;
          circle.y += move.y;
        }
      }

      // Set Style
      Style style = new Style();
      style.fillColor = chooseColor(orange, orange2);

      // // Color background circles
      // if (letter.containsPoint(x, y, diameter * 0.5)) {
      //   // style.fillColor = chooseColor(pink, pink2);
      //   style.fillColor = pink2;
      // }

      style.doStroke = false;
      // style.fillColor = color(style.fillColor, 128);  // Debug
      circle.style = style;
      circle.drawRatio = 0.95;

      circleList.add(circle);
      tryCount = 0;
    }
  } while (tryCount < nTries);
}
