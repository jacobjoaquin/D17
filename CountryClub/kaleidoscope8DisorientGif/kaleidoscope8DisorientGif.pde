// User settings
boolean captureFrames = true;
String filetype = "gif";
int nFrames = 128;
int nProofs = 25;
int seed = 2017;
color orange = color(255, 128, 20);
color pink = color(235, 8, 172);
color yellow = color(255, 220, 18);
//color yellow = color(0);

// Internal Globals
PGraphics pg;
Kaleidoscope kscope;
ArrayList<Integer> baseColors = new ArrayList<Integer>();
color baseColor;
int baseColorIndex = 0;
int nSideCounter = 0;
PImage buttonMask;
float coef;

void settings() {
  //size(200, 200, P2D);
  //size(705, 705, P2D);  // 600 DPI
  //size(1410, 1410, P2D);  // 1200 DIP
  size(1280, 720, P2D);
  //pixelDensity(displayDensity());
}

void setup() {
  coef = width / 705.0;  // 705 is the original prototyping size
  noiseSeed(seed);
  randomSeed(seed);
  pg = createGraphics(width, height, P2D);
  kscope = new Kaleidoscope(pg, 3);
  //buttonMask = loadImage("whiteButtonMask.png");
  //buttonMask = loadImage("blackButtonMask.png");
  buttonMask = loadImage("blackMask720p.png");
  //buttonMask = loadImage("purpleButtonMask.png");

  // Base colors
  //baseColors.add(color(79, 14, 88));
  baseColors.add(color(128, 1, 96));
  baseColors.add(color(255, 192, 64));
  baseColors.add(color(255, 128, 32));
  baseColors.add(color(255, 128, 196));

  //if (!captureFrames) {
  //  noLoop();
  //}
}

void draw() {
  println(frameCount);
  background(0);
  generateButton();
  //createProofs(nProofs);


  saveFrame("./tiff/######.tiff");
  if (frameCount == nFrames) {
    exit();
  }
}


//void keyPressed() {
//  if (!captureFrames && key == 'r') {
//    redraw();
//  }
//}