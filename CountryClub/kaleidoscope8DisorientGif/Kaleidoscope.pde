class Kaleidoscope {
  PGraphics pg;
  PGraphics source;
  int nSides;

  Kaleidoscope(PGraphics source, int nSides) {
    this.nSides = nSides;
    pg = createGraphics(width, height, P2D);
    pg.beginDraw();
    setSource(source);
    setTextureMode(NORMAL);
    pg.endDraw();
  }

  void beginDraw() {
    pg.beginDraw();
  }

  void endDraw() {
    pg.endDraw();
  }

  //void updateFromCanvas() {
  //  Do pixel[] copy method here
  //}

  void setSource(PGraphics source) {
    this.source = source;
  }

  void setTextureMode(int mode) {
    pg.textureMode(mode);
  }

  void setTextureWrap(int wrap) {
    pg.textureWrap(wrap);
  }

  void setNumSides(int nSides) {
    this.nSides = nSides;
  }

  void update() {
    pg.clear();
    pg.pushMatrix();
    pg.pushStyle();
    pg.noStroke();
    pg.translate(pg.width / 2.0, pg.height / 2.0);

    float rotateOffset = TWO_PI / (float) nSides;

    float vertexBoundary = sqrt(pg.width * pg.width * 0.5) * 1.05;
    float vertexBoundary2 = 1.0 / (float) nSides * 4;
    
    for (int i = 0; i < nSides; i++) {
      pg.pushMatrix();
      pg.rotate(i * rotateOffset);
      for (int j = 0; j < 2; j++) {
        pg.beginShape();
        pg.texture(source);
        pg.vertex(0, 0, 0, 0);
        PVector p = new PVector(vertexBoundary, 0);  
        pg.vertex(p.x, p.y, 0, 1);
        p.rotate(rotateOffset / 2.0 * (j == 0 ? 1 : -1));
        pg.vertex(p.x, p.y, vertexBoundary2, 1);
        pg.endShape();
      }

      pg.popMatrix();
    }

    pg.popStyle();
    pg.popMatrix();
  }

  void display(PGraphics dest) {    
    dest.image(pg, 0, 0, width, height);
  }
  
  void display(PGraphics dest, int x, int y, int w, int h) {    
    dest.image(pg, x, y, w, h);
  }

  void display() {    
    image(pg, 0, 0, width, height);
  }
}