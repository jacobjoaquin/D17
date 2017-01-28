abstract class Letter {
  private String[] data;
  int w;
  int h;
}

class LetterDSmall extends Letter {
  PVector position;

  private float circleRatio = 0.9;
  private float letterWidth;
  private float tile;
  private float tileSize;
  private ArrayList<String> letter = new ArrayList<String>();
  private int w;
  private int h;

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

// String[] disorientD = {
//   "xxxx ",
//   "x   x",
//   "x   x",
//   "xxxx "
// };
//
// ArrayList<Circle> createD(PVector p, float w) {
//   float s = w / (float) disorientD[0].length();
//   float xOffset = p.x - s * 2.5 + s / 2.0;
//   float yOffset = p.y - s * 2 + s / 2.0;
//
//   ArrayList<Circle> list = new ArrayList<Circle>();
//
//
//   for (int y = 0; y < 4; y++) {
//     for (int x = 0; x < disorientD[y].length(); x++) {
//       PVector position = new PVector(x * s + xOffset, y * s + yOffset);
//       char dot = disorientD[y].charAt(x);
//       if (dot == 'x') {
//         Style style = new Style();
//         style.fillColor = pink;
//         style.doStroke = true;
//
//         Circle circle = new Circle(position, s * 0.9);
//         circle.style = style;
//         list.add(circle);
//       }
//     }
//   }
//
//   return list;
// }
