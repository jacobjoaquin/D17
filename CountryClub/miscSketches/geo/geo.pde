void settings() {
  size(800, 800, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  noLoop();
  noStroke();
  fill(255);
  background(255);
  
  rectMode(CENTER);
  float ts = width / 3.0;
  float s = ts * 0.85;
  translate(width / 2.0, height / 2.0);
  rotate(QUARTER_PI);
  scale(0.5);
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  scale(0.95);
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      float y = j * ts; 
      float x = i * ts;
      
      rect(x, y, s, s);
    }
  }
  
  save("geo.png");
}