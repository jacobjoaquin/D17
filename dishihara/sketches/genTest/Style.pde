class Style {
  boolean doStroke = true;
  boolean doFill = true;
  color strokeColor = color(0);
  color fillColor = color(255);
  float weight = 1;
  ArrayList<Style> stack = new ArrayList<Style>();

  Style() {};

  Style(color fillColor, color strokeColor) {
    this.fillColor = fillColor;
    this.strokeColor = strokeColor;
  }

  void begin() {
    pushStyle();
    if (doStroke) {
      strokeWeight(weight);
      stroke(strokeColor);
    } else {
      noStroke();
    }
    if (doFill) {
      fill(fillColor);
    } else {
      noFill();
    }
  }

  void end() {
    popStyle();
  }
}
