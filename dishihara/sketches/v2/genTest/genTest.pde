// DIShihara Generation Test

// Settings
float minSize = 18;
float maxSize = 40;
int nTries = 1000;
color orange = color(255, 128, 0);
color orange2 = color(255, 192, 32);
color pink = color(251, 65, 236);
color pink2 = color(250, 146, 231);

// Other
ArrayList<Circle> circleList;
VectorGraphic vectorGraphic;
Letter letterD;
Letter letter17;
PImage img;
PGraphics pg;

// Seed
int randomSeed = 2017;

void settings() {
  size(868, 985, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  img = loadImage("./assets/shirt.png");
  noLoop();
  randomSeed(randomSeed);
  PVector center = new PVector(0, 0);
  circleList = new ArrayList<Circle>();

  // Create D and 17
  letterD = new LetterDLarge(center, width * 0.6);
  letter17 = new Letter17Alt(center, width * 0.6);

  // Add Letters
  float circleRatio = 0.9;
  letterD.setCircleRatio(circleRatio);
  letter17.setCircleRatio(circleRatio);
  for (Circle c : letterD.toCircleList()) {
    c.style.doStroke = false;
  }
  for (Circle c : letter17.toCircleList()) {
    c.style.doStroke = false;
  }

  // Create other circles
  circleFill(circleList);

  // Update colors
  for (Circle c : circleList) {
    boolean insideD = letterD.containsPoint(c.x, c.y, c.diameter * 0.5);
    boolean inside17 = letter17.containsPoint(c.x, c.y, c.diameter * 0.5);

    if (insideD) {
      c.style.fillColor = pink;
    }

    if (insideD && inside17) {
      if (c.diameter <= 8) {
        c.style.fillColor = orange2;
      } else {
        if (random(1) < 1) {
          c.style.fillColor = pink2;
        } else {
          c.style.fillColor = pink;
        }

      }
    } else if (insideD) {
      c.style.fillColor = pink;
    } else if (inside17) {
      if (random(1) < 1) {
        c.style.fillColor = orange2;
      }
    } else {
      if (random(1) < 1) {
        c.style.fillColor = orange;
      } else {
        c.style.fillColor = orange2;
      }
    }
  }

}

void draw() {
  // Draw shirt image
  image(img, 0, 0);

  // Draw circles
  translate(width * 0.51, height * 0.35);
  scale(0.35, 0.35);
  for (Circle c : circleList) {
    c.display();
  }

  // Save
  save("./output/latest.png");

  // Print information
  println("Number of circles: " + circleList.size());
  println("Render complete");
}
