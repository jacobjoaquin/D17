void createProofs(int nSheets) {
  buttonMask = loadImage("whiteButtonMask.png");
  PGraphics pgout = createGraphics(width * 3, height * 3);

  for (int sheet = 0; sheet < nSheets; sheet++) {
    pgout.beginDraw();
    pgout.clear();
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        int xOffset = pgout.width / 3 * x;
        int yOffset = pgout.height / 3 * y;
        baseColor = baseColors.get(baseColorIndex);
        baseColorIndex = (baseColorIndex + 1) % baseColors.size();
        createImage();
        int nSides = (nSideCounter + 2) * 2;
        nSideCounter++;
        nSideCounter %= 6;
        kscope.setNumSides(nSides);
        kscope.beginDraw();
        kscope.update();
        kscope.endDraw();
        pgout.pushMatrix();
        pgout.copy(kscope.pg, 0, 0, width * 2, height * 2, xOffset, yOffset, width, height);
        pgout.popMatrix();
        pgout.pushMatrix();
        pgout.translate(xOffset, yOffset);
        smallLetterD(pgout);
        pgout.image(buttonMask, 0, 0, width, height);
        pgout.popMatrix();
      }
    }
    pgout.endDraw();
    pgout.save("./600/sheet" + sheet + ".png");
  }

  pgout.save("temp.png");
  exit();
}