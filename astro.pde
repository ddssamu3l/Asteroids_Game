class Asteroid extends gameObjects{
    
  Asteroid(){
    lives =1;
    location = new PVector (random(0,width), random(0,height));
    velocity= new PVector(0,1);
    velocity.rotate(random(0,TWO_PI));
    size = 100;
  }
  
  Asteroid(int s, float x, float y){
     lives = 1;
     location= new PVector(x,y);
     velocity = new PVector (0,1);
     velocity.rotate(random(0, TWO_PI));
     size = s;
  }
  
  void show(){
     noFill();
     stroke(255);
     ellipse(location.x,location.y,size,size);
  }
  void act(){
     super.act(); 
     
      int j=0;
      // asteroid acting code
    while(j<Bullets.size()){
       gameObjects b = Bullets.get(j);
       if(b instanceof bullet){
           if(dist(location.x,location.y,b.location.x,b.location.y)<= size/2+b.size){
               score++;
               Bullets.add(new explode(location)); Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));
               Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));Bullets.add(new explode(location));
               b.lives = 0;
               lives = 0;
               if(size>90){
               Bullets.add(new Asteroid(size/2,location.x,location.y));
               Bullets.add(new Asteroid(size/2,location.x,location.y));
              // Bullets.add(new Asteroid());
               }
               
           }
       }
       else if(b instanceof ship){ // if asteroid hits ship
         if(dist(location.x,location.y,Bullets.get(j).location.x,Bullets.get(j).location.y)<= size/2+50){
             Bullets.get(j).lives = Bullets.get(j).lives-1; 
         }
       }
      j++;
    }
  }
  
}
