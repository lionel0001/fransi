class Flower
{
  float x1;
  float y1;
  float cx1;
  float cy1;
  float cx2;
  float cy2;
  float x2;
  float y2;
  color colour;
  float strokeWidth;
  int z;
  float[] movement;
  
  Flower (int _z)
  {
    this.z = _z;
    this.movement = new float[(this.z + 1) * 120];
    
    //unten
    this.x1 = random(0, width);
    this.y1 = height;
    
    this.cx1 = random(this.x1 - width/2, this.x1 + width/2);
    this.cy1 = random(height/3, height/2);
    
    //oben
    this.x2 = random(this.x1 - width/8, this.x1 + width/8);
    this.y2 = 10;
    
    this.cx2 = random(this.x2 - width/4, this.x2 + width/4);
    this.cy2 = random(height - height/4, height/2);
    
    colorMode(HSB,360,100,100);
    this.colour = color(130, 100, map(this.z, 0, 10, 20, 120));
    
    this.strokeWidth = map(this.z, 0, 10, 3, 0.5);
  }
  
  void move ()
  {
    float _bewegung = 0;
    
    for (int i = 0; i < this.movement.length - 1; i++) {
      this.movement[i] = this.movement[i+1];
      _bewegung += this.movement[i];
    }    
    this.movement[this.movement.length - 1] = (bewegung*random(.5, 1.5))/(this.z+1);

    _bewegung = (_bewegung + .0001) / this.movement.length;
    
    //unten
    this.cx1 += _bewegung/2;
    
    //oben
    this.x2 += _bewegung;
    this.cx2 += _bewegung;

  }
  
  void draw ()
  {
    this.move();

    stroke(this.colour);
    strokeWeight(this.strokeWidth);
    
    bezier(this.x1, this.y1, this.cx1, this.cy1, this.cx2, this.cy2, this.x2, this.y2);
    
    //line(this.x1,this.y1,this.x2,this.y2);
    
    /*
    stroke(255, 0, 0);
    line(this.x1, this.y1, this.cx1, this.cy1);
    stroke(0, 255, 0);
    line(this.x2, this.y2, this.cx2, this.cy2);
    */  
  }
}
