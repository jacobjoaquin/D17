color chooseColor(color c0, color c1) {
  return random(1.0) < 0.5 ? c0 : c1;
}


// Modifed from:
// http://www.java2s.com/Code/Java/2D-Graphics-GUI/Returnsclosestpointonsegmenttopoint.htm
PVector getClosestPointOnSegment(PVector p0, PVector p1, PVector point) {
  return getClosestPointOnSegment(p0.x, p0.y, p1.x, p1.y, point.x, point.y);
}

PVector getClosestPointOnSegment(float sx1, float sy1, float sx2, float sy2, float px, float py)
{
  float xDelta = sx2 - sx1;
  float yDelta = sy2 - sy1;

  if ((xDelta == 0) && (yDelta == 0)) {
    return new PVector(sx1, sy1);
  }

  float u = ((px - sx1) * xDelta + (py - sy1) * yDelta) / (xDelta * xDelta + yDelta * yDelta);

  if (u < 0) {
    return new PVector(sx1, sy1);
  }
  else if (u > 1) {
    return new PVector(sx2, sy2);
  }

  return new PVector(sx1 + u * xDelta, sy1 + u * yDelta);
}
