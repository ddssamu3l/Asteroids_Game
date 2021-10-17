class explode  extends gameObjects{
  int t;
  explode(PVector loc){
     lives = 1;
      size = int(random(5,12));
      t=255;
     // loc = new PVector (myShip.length
     location=loc.copy();
     velocity = new PVector(random(-1,1),random(-1,1));
     velocity.rotate(random(-0.5,0.5)); 
     velocity.setMag(random(0.1,1)); 
  }
  
  
  void show(){
    noStroke();
    fill(255,255,255,t);
     rect(location.x,location.y,size,size);
   }
   void act(){
      super.act();
      t-=5;
      if(t<=0) lives=0; 
   }
  
}
