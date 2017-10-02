//researched https://openprocessing.org/sketch/48962 for help

float speedX;
float speedY;
float rectX = 280;
float rectY=280;
float rectSides=50;
boolean isHit = false;
Circles [] circles = new Circles [50];

void setup(){
size(600,600);

for(int i = 0; i < circles.length; i++){
      circles[i] = new Circles(200,200,10);
    }
}

void draw(){
    background(255);
    fill(0);
rect(rectX,rectY,rectSides,rectSides);
for(int i = 0; i < circles.length; i++){
     circles[i].update();
     circles[i].checkCollisions();
     circles[i].drawCircle();
    } 
  }
  
  class Circles {
  float x;
  float y;
  float speedX;
  float speedY;
  float circleSize;
  
  Circles(float xpos, float ypos, float csize){
  x = xpos;
  y = ypos;
  circleSize = csize;
  
  speedX = random(-10,10);
  speedY = random(-10,10);
  }
  
  void update(){
    isHit = false;
  x += speedX;
  y += speedY;
  }
  
  void checkCollisions(){
  float r = circleSize/2;
  
  if ((x < r) || (x> width - r)){
    speedX = -speedX;
  }
  
  if ((y < r) || (y> width - r)){
    speedY = -speedY;
  }
  
  
  if((x > rectX) && (x < rectX + rectSides) &&(y > rectY) && (y < rectY + rectSides)) {
    speedX = speedX * -1;
      speedY = speedY * -1;
      isHit = true;
  }
  
  
  
  }
  
  void drawCircle(){
    
    if(isHit == true){
        fill(255,0,0);
        ellipse(x,y,circleSize,circleSize);
    } else{
  fill(0,0,255);
  ellipse(x,y,circleSize,circleSize);
    }
  }
  
 
  }