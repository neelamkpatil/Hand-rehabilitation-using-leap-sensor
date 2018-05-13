
class Shape {

  int x;
  int y;
  int w;
  int h;


  boolean inside;
  int startFrame; 
  int showPress = 0;
  float secInside = -1;
  int r, g, b=255;
  int i=0;

  Shape(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
  }

  void render() {

    if (showPress > 0) {
       fill(r, g, b);
       float rate;
       i = int(random(5));
       rate = octave[int(random(0,5))];
       file[i].play(rate, 1.0);
       showPress--;
       
    } else {
      fill(255, 255, 255);
    }
    noStroke();
    rect(x, y, w, h);

    if (showPress <= 0) {
      fill(255);
      fill(255);
      textAlign(CENTER);
      textSize(30);
    }
  
}





boolean oneIsIn(ArrayList<PVector> points) {    

  // Renew the indexes of playSound so that at the next event the order is different and randomized.
  // playSound[i] = int(random(0,2));


  for (PVector v : points) {
  if (v.x >= x && v.x <= x + w && v.y >= y && v.y <= y + h) {
    return true;
  }
}
return false;
}
void update(ArrayList<PVector> cursors) {
  if (oneIsIn(cursors)) {
    if (inside) {

      pressed();
    } else {
      inside =true;
      startFrame = frameCount;
    }
  } else {
    inside = false;
  }
}


void pressed() {

  showPress = 10;
}

}
