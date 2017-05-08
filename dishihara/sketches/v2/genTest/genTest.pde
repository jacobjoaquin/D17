// DIShihara Generation Test

// Settings
float minSize = 5;
float maxSize = 25;
int nTries = 1000;
color orange = color(255, 128, 0);
// color orange2 = orange;
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
PShape vg;

// Seed
int randomSeed = 2017;

void settings() {
  size(500, 500, P2D);
  pixelDensity(displayDensity());
}

/*
Create D
Create 17
Do the circle fill
Color Circles
Odds of darker for d > odds of lighter for 17
*/

void setup() {
  noLoop();
  randomSeed(randomSeed);
  PVector center = new PVector(width / 2.0, height / 2.0);
  circleList = new ArrayList<Circle>();

  // Create D and 17
  // letter = new LetterDLarge(letterCenter, width * 0.6);
  letterD = new LetterDLarge(center, width * 0.6);
  letter17 = new Letter17(center, width * 0.6);

  // Add Letter
  float circleRatio = 0.9;
  letterD.setCircleRatio(circleRatio);
  letter17.setCircleRatio(circleRatio);
  // for (Circle c : letter.toCircleList()) {
  //   c.style.doStroke = false;
  //   // c.style.fillColor = chooseColor(pink, pink2);
  //   c.style.fillColor = pink;
  //   // circleList.add(c);
  // }


  // Create other circles
  circleFill(circleList);

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
          if (random(1) < 0.8) {
          c.style.fillColor = pink2;
        } else {
          c.style.fillColor = pink;
      }

        }
        } else if (insideD) {
          c.style.fillColor = pink;
          } else if (inside17) {
            if (random(1) < 0.8) {
              c.style.fillColor = orange2;
            }
            } else {
              if (random(1) < 0.9) {
                c.style.fillColor = orange;
                } else {
                  c.style.fillColor = orange2;
                }
              }
            }

          }

          void draw() {
            background(212);
            for (Circle c : circleList) {
              c.display();
            }

            save("./output/latest.png");
            println("Number of circles: " + circleList.size());
            println("Render complete");
          }
