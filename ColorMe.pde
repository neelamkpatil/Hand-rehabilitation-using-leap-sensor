import de.voidplus.leapmotion.*;
import processing.sound.*;

LeapMotion leap;
ArrayList<Shape> shapeList = new ArrayList<Shape>();
ArrayList<PVector> cursors = new ArrayList<PVector>();
SoundFile[] file;
int numsounds = 5;

// Create an array of values which represent the octaves. 1.0 is playback at normal speed, 0.5 is half and 
// therefore one octave down. 2.0 is double so one octave up.
float[] octave = {0.25, 0.5, 1.0, 2.0, 4.0};

// The playSound array is defining how many samples will be played at each trigger event
int[] playSound = {1, 1, 1, 1, 1};
// The trigger is an integer number in milliseconds so we can schedule new events in the draw loop
int trigger;
// This array holds the pixel positions of the rectangles which are drawn each event
int[] posx = {0, 128, 256, 384, 512};

void setup() {
  size(1000, 600);
  leap = new LeapMotion(this);
  

    textAlign(CENTER);
  // Create an array of empty soundfiles
  file = new SoundFile[numsounds];

  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }



  shapeList.add(new Shape(10, 100, 150, 100));
  shapeList.add(new Shape(10, 210, 150, 100));
  shapeList.add(new Shape(10, 320, 150, 100));


  shapeList.add(new Shape(170, 100, 150, 100));
  shapeList.add(new Shape(170, 210, 150, 100));
  shapeList.add(new Shape(170, 320, 150, 100));

  shapeList.add(new Shape(330, 100, 150, 100));
  shapeList.add(new Shape(330, 210, 150, 100));
  shapeList.add(new Shape(330, 320, 150, 100));

  shapeList.add(new Shape(490, 100, 150, 100));
  shapeList.add(new Shape(490, 210, 150, 100));
  shapeList.add(new Shape(490, 320, 150, 100));

  shapeList.add(new Shape(650, 100, 150, 100));
  shapeList.add(new Shape(650, 210, 150, 100));
  shapeList.add(new Shape(650, 320, 150, 100));

  shapeList.add(new Shape(810, 100, 150, 100));
  shapeList.add(new Shape(810, 210, 150, 100));
  shapeList.add(new Shape(810, 320, 150, 100));
}


void draw() {
  background(100);
 

  for (Shape sh : shapeList) {
    sh.render();
  }



  strokeWeight(3);
  noFill();
  for (Hand hand : leap.getHands()) {
    Finger index = hand.getIndexFinger();
    PVector pos = index.getPosition();
    if (hand.isRight()) {
      stroke(100, 0, 0);
    } else {
      stroke(0, 100, 0);
    }
    ellipse(pos.x, pos.y, 30, 30);
    cursors.add(pos);
  }

  for (Shape sh : shapeList) {

    sh.update(cursors);
  }
}
