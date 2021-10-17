class bullet extends gameObjects{
  int timer;
  
  bullet(){
    timer = 80;
    lives = 1;
     location = new PVector(myShip.location.x,myShip.location.y);
     velocity = new PVector(myShip.direction.x,myShip.direction.y);
     velocity.setMag(13);
     size = 10;
     
  }
  
  void show(){
    stroke(255);
    noFill();
    ellipse(location.x,location.y,size,size);
  }
  
  void act(){      
     super.act();
     timer--;
     if(timer<=0) lives=0;
  }
}
