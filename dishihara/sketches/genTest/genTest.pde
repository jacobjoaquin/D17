// DIShihara Generation Test

// Settings
float minSize = 10;
float maxSize = 25;
int nTries = 100;
color orange = color(255, 128, 0);
color orange2 = color(255, 192, 64);
color pink = color(251, 65, 236);
color pink2 = color(250, 146, 231);

// Other
ArrayList<Circle> circleList;
Letter letter;
String imgName = "./assets/bmlogofill.png";
PImage img;
PGraphics pg;
String vgName = "./assets/bmlogoTraced.svg";
PShape vg;

void settings() {
  size(500, 500, P2D);
  // pixelDensity(displayDensity());
}

void setup() {
  noLoop();
  randomSeed(2017);
  PVector center = new PVector(width / 2.0, height / 2.0);
  circleList = new ArrayList<Circle>();

  // Setup Image
  img = loadImage(imgName);
  pg = createGraphics(width, height, P2D);
  println(pixelHeight);
  pg.beginDraw();
  pg.imageMode(CENTER);
  float r = (float) img.width / (float) img.height;
  float s = 0.6;
  pg.image(img, width / 2.0, height / 2.0, width * r * s, height * s);
  pg.endDraw();
  pg.loadPixels();

  // Setup SVG
  vg = loadShape(vgName);

  // Create Disorient "D" Goes Here
  // letter = new LetterDSmall(center, width * 0.6);
  // letter = new LetterDLarge(center, width * 0.6);
  letter = new Letter17(center, width * 0.6);
  // letter = new Letter2017(center, width * 0.8);

  // Add small D
  // letter.setCircleRatio(0.9);
  // for (Circle c : letter.toCircleList()) {
  //   c.style.doStroke = false;
  //   // c.style.fillColor = chooseColor(pink, pink2);
  //   c.style.fillColor = pink;
  //   circleList.add(c);
  // }


  // Create other circles
  circleFill(circleList);
}

void draw() {
  background(16);
  for (Circle c : circleList) {
    c.display();
  }

  // Image testing
  // int l = width * height;
  // loadPixels();
  // for (int i = 0; i < l; i++) {
  //   if(brightness(pg.pixels[i]) < 30) {
  //     color c = pixels[i];
  //     pixels[i] = lerpColor(c, color(0), 0.5);
  //   }
  // }
  // updatePixels();

  // Shape testing
  // PShape group = vg.getChild(0).getChild(0);
  // int nChild = group.getChildCount();
  //
  // pushStyle();
  // noStroke();
  // fill(pink);
  // for (int i = 0; i < nChild; i++) {
  //   PShape child = group.getChild(i);
  //   int nVertices = child.getVertexCount();
  //   beginShape();
  //   for (int j = 0; j < nVertices; j++) {
  //     PVector p = child.getVertex(j);
  //     println(p);
  //     vertex(p.x * 0.5, p.y * 0.5);
  //   }
  //   endShape(CLOSE);
  // }
  // popStyle();

  stroke(255, 32);
  line(0, 0, width, height);

  save("./output/latest.png");
  println("Render complete");
}
