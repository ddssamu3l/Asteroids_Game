//samuel deng oct 4th 2021
import java.util.Random;
Boolean up,down,left,right,space,tp;
ship myShip;
float mode, game, start,end,pause,score;
Boolean isPause;
gif g;
PFont font;
PImage ufoImage;
ArrayList <gameObjects> Bullets;

void setup(){
  size(800,800);
  isPause = false;
  score=0;
  mode = 0;
  start = 0;
  game = 1;
  pause = 2;
  end = 3;
  
  font = createFont("Starjedi.ttf",200);
  
  imageMode(CENTER);
  myShip = new ship();
  Bullets = new ArrayList<gameObjects>();
  up=down=left=right=space=false;
  Bullets.add(new Asteroid());
  Bullets.add(new Asteroid());
  Bullets.add(new Asteroid());
  tp = false;
  ufoImage = loadImage("UFO_Pic.png");
  
  g = new gif(80,"starting screen gif");
  
}

void draw(){
  background(0);
  if(mode == start) {startMenu();}
  else if(mode == game) game();
  else if(mode == pause) pause();
  else if(mode == end) {end();}
  else background(255,0,0);
}

void mouseClicked(){

  if(mode == start && mouseX>=width/2-150 && mouseX<=width/2+150 && mouseY>=height/2+150 && mouseY<=height/2+250){
    mode = game;
  }
  else if(mode == game){
      mode = pause;
  }
  else if(mode == pause){
     mode = game; 
  }
  else if(mode == end){
     mode = start; 
       setup();
  }
}  



void keyPressed(){
   if(keyCode == UP) up = true;
   if(keyCode == DOWN) down = true;
   if(keyCode == LEFT) left = true;
   if(keyCode == RIGHT) right = true;
   if(keyCode == ' ') space = true;
   if(keyCode == 't' || keyCode =='T') tp=true;
}

void keyReleased(){
    if(keyCode == UP) up = false;
   if(keyCode == DOWN) down = false;
   if(keyCode == LEFT) left = false;
   if(keyCode == RIGHT) right = false;
   if(keyCode == ' ') space = false;
   if(keyCode == 't' || keyCode =='T') tp=false;
}
