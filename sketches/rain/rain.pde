PImage img;
// the path to the image is relative to the page where the script is run from
img = loadImage("/p5lab/sketches/rain/Madrid.jpg");
//img = loadImage("Madrid.jpg");
void setup(){
  size(1415/3,940/3); // had to hard code the size to 
  // make javascript use the right dimensions
  //size(int(img.width/2),int(img.height/2));
  frameRate(24);
  background(255);
}
float m = 1;
color c;
int mouseval = 0;
void draw(){
  if(mouseval==1){
    noStroke();

    if(m<8000)
      m = m * 1.1;
    else
      m=8000;

    for(int i = 0; i < int(m); i++){
      float r = random(1.0, 6.0);

      int xi = int(random(0, img.width));
      int yi = int(random(0, img.height));
      c = img.get(xi, yi);

      fill(c);
      ellipse(xi/3, yi/3, r, r);
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
