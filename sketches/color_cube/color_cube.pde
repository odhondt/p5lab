/* @pjs preload="sketches/color_cube/BarcelonetaColors.jpg"; */
PImage img;

int csp[][][]; // Colors in 3D space
int pts[][]; // Color points

float xrot, yrot = 0;
float newXrot, newYrot = 0; 

int ncol = 64; // number of quantization levels
int cnt = 0;
float zoom = 0.75;

float posX, posY;
float dX, dY;

String url = "sketches/color_cube/BarcelonetaColors.jpg";
img = loadImage(url);
img.resize(img.width/10,0);

void setup(){
  size(640, 360, P3D);
  background(32);

  colorMode(RGB);
  // Init color space mask
  csp = new int[ncol][ncol][ncol];
  for(int b = 0; b < ncol; b++){
    for(int g = 0; g < ncol; g++){
      for(int r = 0; r < ncol; r++){
        csp[r][g][b] = 0;
      }
    }
  }

  // counts the number of distinct colors
  // (to avoid redundancy)
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
        color c = img.pixels[x+y*img.width];
        int r = int((red(c) / 255) * (ncol - 1));
        int g = int((green(c) / 255) * (ncol - 1));
        int b = int((blue(c) / 255) * (ncol - 1));
        if(csp[r][g][b] != 1){
          csp[r][g][b] = 1;
          cnt++;
        } 
    }
  }

  // Making color list
  pts = new int[cnt][3];
  int idx = 0;
  for(int b = 0; b < ncol; b++){
    for(int g = 0; g < ncol; g++){
      for(int r = 0; r < ncol; r++){
        if(csp[r][g][b] == 1){
          pts[idx][0] = int( (float(r)/(ncol-1)*255) );
          pts[idx][1] = int( (float(g)/(ncol-1)*255) );
          pts[idx][2] = int( (float(b)/(ncol-1)*255) );
          idx++;
        }
      }
    }
  }
  noLoop();

}


void draw(){
  background(32);
  translate(width/2, height/2); 
  
  rotateX(xrot); 
  rotateY(yrot); 
  //    rotateZ(PI/6.0);
  //    rotateX(5*PI/6.0);
  //    rotateY(PI/4.0);
  if(zoom>0.07){
    scale(zoom);
  }else{
    scale(0.07);
  }

  for(int p = 0; p < cnt; p++){
    strokeWeight(2.5);
    stroke(pts[p][0], pts[p][1], pts[p][2], 250);
    point(pts[p][0]-127, pts[p][1]-127, pts[p][2]-127);
  }
  stroke(255,255,255,25);
  strokeWeight(3);
  noFill();
  box(255);

  noLoop();
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if(e < 0){
    zoom += 0.05;
  }
  if(e > 0){
    zoom -= 0.05;
  }
}

void mousePressed() {

  posX = mouseX;
  posY = mouseY;
//  newXrot = mouseX/float(width) * TWO_PI;
//  newYrot = mouseY/float(height) * TWO_PI;
}

void mouseDragged() {
  loop();
  newXrot = xrot;
  newYrot = yrot;
  
  dX = posX - mouseX;
  dY = posY - mouseY;

  xrot = 0.5 * (newXrot + dY/float(height) * TWO_PI);
  yrot = 0.5 * (newYrot - dX/float(width) * TWO_PI);
 
}
