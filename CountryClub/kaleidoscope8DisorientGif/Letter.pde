String[] smallLetter = {
  "xxxx ", 
  "x   x", 
  "x   x", 
  "xxxx "
};

void smallLetterD() {
  pushStyle();
  blendMode(BLEND);
  stroke(baseColors.get(0));
  //noStroke();
  fill(255);
  float s = 90 * coef * 0.617;
  pushMatrix();
  translate(width / 2.0 - s * 2.5, height / 2.0 - s * 2);
  translate(s / 2.0 + 20, s / 2.0);
  for (int y = 0; y < 4; y++) {
    strokeWeight(random(3, 4) * coef);
    pushMatrix();
    translate(0, y * s);

    for (int x = 0; x < 5; x++) {
      pushMatrix();
      translate(x * s, 0);
      char dot = smallLetter[y].charAt(x);
      if (dot == 'x') {
        scale(0.9);
        ellipse(0, 0, s, s);
      }
      popMatrix();
    }
    popMatrix();
  }
  popStyle();
  popMatrix();
}

void smallLetterD(PGraphics pg) {
  pg.pushStyle();
  pg.blendMode(BLEND);
  //pg.stroke(baseColor);
  pg.stroke(baseColors.get(0));
  pg.fill(255);
  float s = 90 * coef;
  pg.pushMatrix();
  pg.translate(width / 2.0 - s * 2.5, height / 2.0 - s * 2);
  pg.translate(s / 2.0, s / 2.0);
  for (int y = 0; y < 4; y++) {
    pg.strokeWeight(random(3, 4) * coef);
    pg.pushMatrix();
    pg.translate(0, y * s);

    for (int x = 0; x < 5; x++) {
      pg.pushMatrix();
      pg.translate(x * s, 0);
      char dot = smallLetter[y].charAt(x);
      if (dot == 'x') {
        pg.scale(0.9);
        pg.ellipse(0, 0, s, s);
      }
      pg.popMatrix();
    }
    pg.popMatrix();
  }
  pg.popStyle();
  pg.popMatrix();
}