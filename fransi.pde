import fullscreen.*; 

FullScreen fs; 

Flower[] flowers;
int numberOfFlowers;
float bewegung;
int timeToChange;

void setup ()
{
  size(1440, 900);
  smooth();
  //noLoop();
  
  numberOfFlowers = (int) width/20;
  
  // Create the fullscreen object
  fs = new FullScreen(this); 
  
  // enter fullscreen mode
  fs.enter(); 

  
  flowers = new Flower[numberOfFlowers];
  for (int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower((int) map(i, 0, flowers.length, 10, 0));
  }
  
  timeToChange = 0;
}

void draw ()
{ 
  
  if (millis() > timeToChange) {
    timeToChange = millis() + (int) random(3000, 5000);
    bewegung = random((width/1000)*-1, width/1000);
  }
  
  colorMode(RGB, 255, 255, 255);
  background(255);
  noFill();
  for (int i = 0; i < flowers.length; i++) {
    flowers[i].draw();
  }
  //filter(BLUR, 3);
}

void keyPressed ()
{
  redraw();
}
