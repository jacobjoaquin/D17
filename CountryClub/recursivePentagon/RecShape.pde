class RecShape {
  ArrayList<PVector> points;
  
  RecShape() {
    points = new ArrayList<PVector>();
  }
  
  RecShape(ArrayList<PVector> copiedPoints) {
    points = new ArrayList<PVector>();
    
    for (PVector p : copiedPoints) {
      points.add(p.get());
    }
  }
  
  void add(float x, float y) {
    add(new PVector(x, y));
  }
  
  void add(PVector p) {
    points.add(p);
  }
  
  void display() {
    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
  }
  
  RecShape spawn(float offset) {
    RecShape shape = new RecShape();

    int s = points.size();
    for (int i = 0; i < s; i++) {
      PVector p0 = points.get(i);
      PVector p1 = points.get((i + 1) % s);
      shape.add(lerp(p0.x, p1.x, offset), lerp(p0.y, p1.y, offset)); 
    }
    
    return shape;
  }
}