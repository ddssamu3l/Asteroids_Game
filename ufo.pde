class UFO extends gameObjects{
  float shotInterval;
  UFO(){
    int i = (int)random(0,3);
    println(i);
    // randomize starting location------------------------------
    if(i==0){
      location = new PVector(-50,-50);
      velocity = new PVector(random(0.5,3),random(1,2));
      print( velocity.x+" "+ velocity.y);
    }
    else if(i==1){
      location = new PVector(width+50,-50);
      velocity = new PVector(random(-3,-1),random(1,2));
      print( velocity.x+" "+ velocity.y);
    }
    else if(i==2){
      location = new PVector(-50,height+50);
      velocity = new PVector(random(0.5,3),random(-2,-1));
      print( velocity.x+" "+ velocity.y);
    }
    else if(i==3){
      location = new PVector(width+50,height+50);
      velocity = new PVector(random(-3,-0.5),random(-2,-1));
      print( velocity.x+" "+ velocity.y);
    } 
    else{ println("error ");}
    //=====================================================
       lives =1;
       size = 70;
       shotInterval = random(100,250);
  }
  void show(){
    //image(ufoImage,location.x,location.y,80,80);
    fill(255,0,0);
    ellipse (location.x,location.y,size,size);
  }
  void act(){
   
    location.add(velocity);
    // UFO ACTING CODE       IF OUT OF SCREEN SPACE THEN IT IS REMOVED
     if(location.y<-50 ||location.y>height+50||location.x<-50||location.x>width+50)lives = 0;
      if(shotInterval<=0){ // UFO SHOOTING CODE
         Bullets.add(new UFOBullet(location,new PVector(myShip.location.x-location.x,myShip.location.y-location.y)));
         shotInterval = 250;
      }
      shotInterval--;
      int j = 0;
       while(j<Bullets.size()){ // CHECK IF SHIP BULLET HAS HIT THE UFO
       gameObjects b = Bullets.get(j);
       if(b instanceof bullet){
           if(dist(location.x,location.y,b.location.x,b.location.y)<= size/2+b.size){
             lives = 0;
             b.lives = 0;
             print("hi");
           }
       }
       j++;
    }

  }
  
}
