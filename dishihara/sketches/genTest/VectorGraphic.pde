class VectorGraphic {
  PShape pshape;
  PGraphics pg;
  ArrayList<Line> lineList = new ArrayList<Line>();

  VectorGraphic(PShape pshape) {
    this.pshape = pshape;
    toLineList();
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

  void display() {
    pushStyle();
    stroke(255, 64);
    for (Line line : lineList) {
      line.display();
    }
    popStyle();
  }
}
