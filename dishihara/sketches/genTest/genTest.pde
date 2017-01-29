// DIShihara Generation Test

// Settings
float minSize = 5;
float maxSize = 25;
int nTries = 1000;
color orange = color(255, 128, 0);
color orange2 = color(255, 192, 64);
color pink = color(251, 65, 236);
color pink2 = color(250, 146, 231);

// Other
ArrayList<Circle> circleList;
Letter letter;

void settings() {
  size(500, 500, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  randomSeed(2017);
  PVector center = new PVector(width / 2.0, height / 2.0);
  circleList = new ArrayList<Circle>();

  // Create Disorient "D" Goes Here
  // letter = new LetterDSmall(center, width * 0.6);
  // letter = new LetterDLarge(center, width * 0.6);
  letter = new Letter17(center, width * 0.6);

  // Add small D
  letter.setCircleRatio(0.9);
  for (Circle c : letter.toCircleList()) {
    c.style.doStroke = false;
    // c.style.fillColor = chooseColor(pink, pink2);
    c.style.fillColor = pink;
    circleList.add(c);
  }

  // Create other circles
  circleFill(circleList);
}

void draw() {
  background(16);
  noLoop();
  for (Circle c : circleList) {
    c.display();
  }
  save("./output/latest.png");
}
