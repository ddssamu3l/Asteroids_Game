class fire extends gameObjects{
  
  int t; // transparency value
  PVector nudge;
  
  fire(){
      lives = 1;
      size = int(random(5,12));
      t=255;
     // loc = new PVector (myShip.length
     location = myShip.location.copy();
     nudge = myShip.direction.copy();
     nudge.rotate(PI);
     nudge.setMag(10);
     location.add(nudge);
     velocity = myShip.direction.copy();
     velocity.rotate(PI+random(-0.5,0.5)); // 180 degrees or opposite direction
     velocity.setMag(5);
  }
 
  
  void show(){
    noStroke();
    fill(255,0,0,t);
     square(location.x,location.y,size);
  }
  void act(){
      super.act();
      t-=5;
      if(t<=0) lives=0;
  }
  
}
