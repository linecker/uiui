// You'll need a recent version of processing and the sound library to run this.
// Add more files via extending g and b; it's assumed that the images have a width/height-ratio that fit the screen well.

import processing.sound.*;

SoundFile zonk;
SoundFile applaus;

String[] g = {"g1.jpg", "g2.jpg"};
String[] b = {"b1.jpg", "b2.jpg"};
int gc = 0, bc = -1;
int g_len = g.length;
int b_len = b.length;
char g_or_b = 'g';

PImage img;

void my_draw(String p)
{
  img = loadImage(p);
  image(img, 0, 0, width, height);
}

void setup()
{
  fullScreen();
  my_draw(g[1]);
  noCursor();
  zonk = new SoundFile(this, "zonk.mp3");
  applaus = new SoundFile(this, "applaus.mp3");
}

void keyPressed()
{
  if (key == ' ') {
    // start from scratch
    gc = 0; 
    bc = -1;
    g_or_b = 'g';
  } else if (key == 't') {
    // test applause
    applaus.play();
  } else if (key == 'g') {
    applaus.play();
    gc++;
    g_or_b = 'g';
    if (gc >= g_len) {
      gc = 0;
    }
  } else if (key == 'u') {
    zonk.play();
    bc++;
    g_or_b = 'b';
    if (bc >= b_len) {
      bc = 0;
    }
  }
  String p = "";
  if (g_or_b == 'g') {
    p = g[gc];
  } else {
    p = b[bc];
  }
  my_draw(p);
}

void draw()
{
}
