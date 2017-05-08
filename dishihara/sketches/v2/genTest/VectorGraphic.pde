// class VectorGraphicList extends ArrayList<VectorGraphic> {
//
// }

class VectorGraphic {
  PShape pshape;
  PGraphics pg;
  ArrayList<Line> lineList = new ArrayList<Line>();

  VectorGraphic(PShape pshape) {
    this.pshape = pshape;
    toLineList();
  }

  PVector getClosestPoint(float x, float y) {
    if (lineList.size() > 0) {
      PVector closest = lineList.get(0).p0.copy();
      float distance = dist(x, y, closest.x, closest.y);
      for (Line line : lineList) {
        PVector p = getClosestPointOnSegment(line.p0.x, line.p0.y, line.p1.x, line.p1.y, x, y);
        float d = dist(p.x, p.y, x, y);
        if (d < distance) {
          distance = d;
          closest = p;
        }
      }

      return closest;
    }

    return null;
  }

  PVector getClosestPoint(PVector p) {
    return getClosestPoint(p.x, p.y);
  }

  private void toLineList() {
    PShape group = pshape;
    int nChild = group.getChildCount();

    for (int i = 0; i < nChild; i++) {
      PShape child = group.getChild(i);
      int nVertices = child.getVertexCount();

      if (nVertices > 1) {
        PVector p0 = child.getVertex(0);
        PVector p1 = child.getVertex(1);

        for (int j = 0; j < nVertices; j++) {
          p1 = child.getVertex(j);
          Line line = new Line(p0.copy().mult(0.5), p1.copy().mult(0.5));
          lineList.add(line);
          p0 = p1.copy();
        }
      }
    }
  }

  private void toPGraphics() {
  }

  void displayLineList() {
    for (Line line : lineList) {
      line.display();
    }
  }

  void display() {
    PShape group = pshape;
    int nChild = group.getChildCount();

    for (int i = 0; i < nChild; i++) {
      PShape child = group.getChild(i);
      int nVertices = child.getVertexCount();

      if (nVertices > 1) {
        beginShape();
        for (int j = 0; j < nVertices; j++) {
          PVector p = child.getVertex(j).mult(0.5);
          vertex(p.x, p.y);
        }
        endShape(CLOSE);
      }
    }
  }
}
