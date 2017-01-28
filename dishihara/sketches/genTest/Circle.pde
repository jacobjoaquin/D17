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


      // Move to closest
      Circle closestCircle = circleList.get(0);
      float closestDistance = circle.distToCircle(closestCircle);
      for (int i = 1; i < circleList.size(); i++) {
        Circle c = circleList.get(i);
        float thisD = circle.distToCircle(c);
        if (thisD < closestDistance) {
          closestCircle = c;
          closestDistance = thisD;
        }
      }
      if (closestDistance > 0 && closestDistance < maxSize * 10) {
        float angle = atan2(y - closestCircle.y, x - closestCircle.x);
        PVector move = PVector.fromAngle(angle).mult(-closestDistance);
        circle.x += move.x;
        circle.y += move.y;
      }



      // Set Style
      Style style = new Style();
      style.fillColor = chooseColor(orange, orange2);
      // if (letterDSmall.containsPoint(x, y, diameter * 0.125)) {
      //   style.fillColor = chooseColor(pink, pink2);
      // }
      style.doStroke = false;
      circle.style = style;

      circle.drawRatio = 0.8;
      circleList.add(circle);
      tryCount = 0;
    }
  } while (tryCount< nTries);

  println(circleList.size());
}
