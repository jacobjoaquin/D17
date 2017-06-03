float xOffset = 0;
float yOffset = 1000;


void createImage() {
  pg.beginDraw();
  pg.clear();
  pg.translate(-pg.width / 2.0, -pg.height / 2.0);

  // Perlin
  float nInc = random(0.0025, 0.02);
  float noiseBoundary = pg.width * 2;

  // Colors
  colorMode(HSB);
  pg.background(baseColor);
  pg.stroke(baseColor);

  // Dots
  int nDots = (int) random(2000, 8000);
  float minSize = random(5, 10);
  float maxSize = random(20, 80);

  // Shapes
  float shapeRatio = random(1.0);
  float rectAngleRatio = random(1.0);

  for (int i = 0; i < nDots; i++) {
    float n = i / (float) nDots;
    float s = random(minSize, maxSize);
    float x = noise(xOffset) * noiseBoundary;
    float y = noise(yOffset) * noiseBoundary;
    xOffset += nInc;
    yOffset += nInc;
    float d = dist(0, 0, x, y);

    // Resize based on distance
    if (random(1.0) < 0.5) {
      s *= map(d, 0, pg.width, 0.25, 1.5);
    } else {
      s *= map(d, 0, pg.width, 1.5, 0.25);
    }

    // Select and process color
    colorMode(RGB);
    float brightness = 255;
    color c;

    if (s > 30) {
      brightness = map(n, 0, 1, 212, 255);
      float r = random(1.0);
      c = r < 0.5 ? orange : pink;

  } else {
      c = yellow;
    }
    float hue = hue(c);
    float saturation = saturation(c);
    colorMode(HSB);
    c = color(hue, saturation, brightness);

    pg.fill(c);
    pg.strokeWeight(random(2, 4) * coef);

    s *= coef;

    // Ellipse
    if (random(1.0) < shapeRatio) {
      pg.ellipse(x, y, s, s * random(1, 2));
    }
    // Rectangle
    else {
      pg.pushMatrix();
      pg.rectMode(CENTER);
      pg.translate(x, y);
      // Offset 45 degrees
      if (random(1.0) < rectAngleRatio) {
        pg.rotate(QUARTER_PI);
      }
      pg.rect(0, 0, s, s);
      pg.popMatrix();
    }
  }
  pg.endDraw();
  pg.resetMatrix();
}

void generateButton() {
  baseColor = baseColors.get(baseColorIndex);
  baseColorIndex = (baseColorIndex + 1) % baseColors.size();
  createImage();
  int nSides = (nSideCounter + 2) * 2;
  nSideCounter++;
  nSideCounter %= 6;
  kscope.setNumSides(nSides);
  kscope.beginDraw();
  kscope.update();
  kscope.display();
  kscope.endDraw();
  smallLetterD();
  image(buttonMask, 0, 0, width, width);
}

void createSheet(int s) {
  pushMatrix();
  scale(1 / (float) s);
  for (int y = 0; y < s; y++) {
    for (int x = 0; x < s; x++) {
      pushMatrix();
      translate(width * x, height * y);
      generateButton();
      popMatrix();
    }
  }
  popMatrix();
  save("sheet.tiff");
  exit();
}