abstract class Letter {
  PVector position;

  protected String[] data;
  protected float circleRatio = 0.9;
  protected float letterWidth;
  protected float tile;
  protected float tileSize;
  protected ArrayList<String> letter = new ArrayList<String>();
  protected int w;
  protected int h;

  void setCircleRatio(float circleRatio) {
    this.circleRatio = circleRatio;
  }

  boolean containsPoint(float x1, float y1, float variance) {
    float xOffset = position.x - tileSize * (float) w / 2.0;
    float yOffset = position.y - tileSize * (float) h / 2.0;

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        PVector p = new PVector(x * tileSize + xOffset, y * tileSize + yOffset);
        char dot = letter.get(y).charAt(x);

        if (dot == 'x') {
          if (x1 + variance > p.x && x1 - variance < p.x + variance + tileSize && y1 > p.y && y1 - variance < p.y + tileSize) {
            return true;
          }
        }
      }
    }

    return false;
  }

  boolean containsPoint(float x1, float y1) {
    return containsPoint(x1, y1, 0);
  }

  boolean containsPoint(PVector p) {
    return containsPoint(p.x, p.y);
  }

  boolean containsPoint(PVector p, float variance) {
    return containsPoint(p.x, p.y, variance);
  }

  ArrayList<Circle> toCircleList() {
    float xOffset = position.x - tileSize * (float) w / 2.0 + tileSize / 2.0;
    float yOffset = position.y - tileSize * (float) h / 2.0 + tileSize / 2.0;
    ArrayList<Circle> list = new ArrayList<Circle>();

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        PVector p = new PVector(x * tileSize + xOffset, y * tileSize + yOffset);
        char dot = letter.get(y).charAt(x);

        if (dot == 'x') {
          Style style = new Style();
          style.fillColor = pink;
          style.doStroke = true;

          Circle circle = new Circle(p, tileSize * circleRatio);
          circle.style = style;
          list.add(circle);
        }
      }
    }

    return list;
  }
}

class LetterDSmall extends Letter {
  LetterDSmall(PVector position, float letterWidth) {
    this.position = position;
    this.letterWidth = letterWidth;
    letter.add("xxxx ");
    letter.add("x   x");
    letter.add("x   x");
    letter.add("xxxx ");
    w = letter.get(0).length();
    h = letter.size();
    tileSize = letterWidth / (float) w;
  }
}

class LetterDLarge extends Letter {
  LetterDLarge(PVector position, float letterWidth) {
    this.position = position;
    this.letterWidth = letterWidth;
    letter.add("xxxxxxxxx ");
    letter.add("xxxxxxxxxx");
    letter.add("xx      xx");
    letter.add("xx      xx");
    letter.add("xx      xx");
    letter.add("xxxxxxxxxx");
    letter.add("xxxxxxxxx ");
    w = letter.get(0).length();
    h = letter.size();
    tileSize = letterWidth / (float) w;
  }
}


class Letter17 extends Letter {
  Letter17(PVector position, float letterWidth) {
    this.position = position;
    this.letterWidth = letterWidth;
    letter.add("xx  xxxxxxxxx ");
    letter.add("xxx xxxxxxxxxx");
    letter.add(" xx         xx");
    letter.add(" xx         xx");
    letter.add(" xx         xx");
    letter.add(" xx         xx");
    letter.add(" xx         xx");
    letter.add(" xx         xx");
    w = letter.get(0).length();
    h = letter.size();
    tileSize = letterWidth / (float) w;
  }
}
