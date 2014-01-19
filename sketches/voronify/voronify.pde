/* @pjs preload="sketches/voronify/Sky.jpg"; */
PImage img;
float dmap[][]; // image of distances

float sc = 0.3; 
color c;
int mouseval = 0;

//  String url = "StLunaire.jpg"; // Comment for p5
String url = "sketches/voronify/Sky.jpg"; // uncomment for p5js
img = loadImage(url);

void setup(){
  size(428,282);
  smooth();
  noStroke();
//  frameRate(60);

  dmap = new float[img.width][img.height];

//  background(0);

  // Initializing
  int xi = int(random(img.width));
  int yi = int(random(img.height));
  c = img.get(xi, yi);
  background(c);

  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float d = (x - int(xi*sc)) * (x - int(xi*sc)) +  (y - int(yi*sc)) * (y - int(yi*sc));
      dmap[x][y] = d;
    }
  }
}



void draw(){
  if(mouseval==1){
    int xi = int(random(img.width));
    int yi = int(random(img.height));
    c = img.get(xi, yi);

    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
      int d = (x - int(xi*sc)) * (x - int(xi*sc)) +  (y - int(yi*sc)) * (y - int(yi*sc));
        if(d < dmap[x][y]){
          dmap[x][y] = d;
          set(x, y, c);
        }
      }
    }
  }
}

void mouseReleased() {
  if(mouseval==0){
    mouseval = 1;
  }else{
    mouseval = 0;
  }
}
