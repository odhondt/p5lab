/* @pjs preload="sketches/dotify/Rynek.jpg"; */

PImage img;
img = loadImage("sketches/dotify/Rynek.jpg");

ArrayList<Dot> DotList;

void setup(){
  size(1428/3, 948/3);
  background(0);
  noStroke();
  smooth();
  frameRate(100);
  DotList = new ArrayList<Dot>();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      if(x%11==0 && y%11==0){
        color c = img.get(x*3, y*3);
        float vx = random(-2,2);
        float vy = random(-2,2);
        DotList.add(new Dot(x,y,vx,vy,7,c));
      }
    }
  }
  for(int i = 0; i < DotList.size(); i++){
    DotList.get(i).display();
  }

}

int mouseval = 0;

void draw(){
  //image(img,0 ,0);

  if(mouseval==1){
    background(0);
    for(int i = 0; i < DotList.size(); i++){
      DotList.get(i).display();
      DotList.get(i).move();
      DotList.get(i).bounce();
    }
  }

}

class Dot{
  float x;
  float y;
  float vx;
  float vy;
  float r;
  color c;

  Dot(float _x, float _y, float _vx, float _vy, float _r, color _c){
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    r = _r;
    c = _c;
  }

  void move(){
    x += vx;
    y += vy;
  }
  
  void bounce(){
    if(x <= r/2 || x >= width - r/2)
      vx = -vx;
    if(y <= r/2 || y >= height - r/2)
      vy = - vy;
  }

  void display(){
    fill(c);
    ellipse(x, y, r, r);
  }
};

void mouseReleased() {
  if(mouseval==0){
    mouseval = 1;
  }else{
    mouseval = 0;
  }
}
