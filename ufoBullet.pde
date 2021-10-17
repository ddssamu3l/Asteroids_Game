class UFOBullet extends gameObjects{
  int timer;
  UFOBullet(PVector loc,PVector vel){ // ufo bullet----------------
      timer = 120;
    lives = 1;
     location = loc.copy();
     velocity = vel.copy();
     velocity.setMag(5);
     size = 10;
  }
  
  void show(){
    stroke(255);
    noFill();
    ellipse(location.x,location.y,size,size);
  }
  
  void act(){      
      // out of bounds
     super.act();
     timer--;
     if(timer<=0) lives=0;
    
      // asteroid acting code
   
  }
}
