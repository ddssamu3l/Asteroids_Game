class ship extends gameObjects {
  // ship class
  float x, y, vx, vy, d, UFOInterval;
  PVector direction;
  Boolean isInvincible;
  int h, s, b;   
  int shotTimer, threshold;
  int invincibleTimer;
  int tpcd;

  //ship constructor
  ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.2);
    shotTimer = 0;
    threshold = 20;
    invincibleTimer = 200;
    UFOInterval = 400;
    isInvincible = true;
    tpcd = 200;
  }
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    if (isInvincible) { // if infincible then draws ship in blue with a circle around it
      stroke(255);ellipse(myShip.x+5,myShip.y,70,70);
      stroke(#1F60FF); 
    } else stroke(255);
    //==================================================================================
    triangle(-10, -10, -10, 10, 25, 0);
    popMatrix();
    fill(255);
    stroke(#1F60FF);
    rect(0,height-50,3*tpcd/2,50);// teleport coodown bar
     textAlign(CENTER,CENTER);
  strokeWeight(10);
  stroke(0);
  textSize(25);
  text("lives: "+ myShip.lives,width-100,height-50); // lives displayer

  }  
  void act() {
    //ship movement
    if (velocity.x>10) velocity.x = 3;
    if (velocity.y>10) velocity.y = 3;
    super.act();
    shotTimer++;
    // keyboard interactions-----------------------
    if (up) {
      velocity.add(direction);
      Bullets.add(new fire());
    }
    if (down)velocity.sub(direction);
    if (left)direction.rotate(-radians(5));
    if (right)direction.rotate(radians(5));
    if (space && shotTimer>threshold) {
      Bullets.add(new bullet());
      shotTimer =0;
    }
    if (up == false && down == false) {
      velocity.setMag(velocity.mag()*0.97);
    }
    // CREATING UFO ===========================================
    if (UFOInterval <=0) {
      Bullets.add(new UFO()); 
      UFOInterval = (float)random(300, 500); 
      println("ufo created");
    }    UFOInterval--;

    // check for collions==========================================
    int j = 0;
    while (j<Bullets.size()) {
      gameObjects b = Bullets.get(j);
      if (!isInvincible &&( b instanceof Asteroid || b instanceof UFOBullet || b instanceof UFO)) {
        if (dist(location.x, location.y, b.location.x, b.location.y)<= size/2+b.size) {
          if(b instanceof UFOBullet) b.lives = 0;
          lives --;
          isInvincible = true;
        }
      }
      j++;
    }
    // INVULNURABILITY CODE==========================================
    if (isInvincible) invincibleTimer-=2;
    if (invincibleTimer <=0) {
      invincibleTimer = 200;
      isInvincible = false;
    }
    if (lives<=0 || score == 9){mode = end;g = new gif(9,"end screen gif"); }
    if (tp) teleport();
    
    if(tpcd<200 && tpcd>0) tpcd--;
    else if(tpcd<=0) tpcd = 200;
  }


  // teleportation code==========================================================================================
  void teleport() {
  if(tpcd>=200){
    PVector v = new PVector(0, 0);
    Boolean isFound = false;
    while (!isFound) {
      float x = random(0, width); 
      float y = random(0, height);
      int j = 0;
      while (j<Bullets.size()&& !isFound ) {
        gameObjects b = Bullets.get(j);
        if ( b instanceof Asteroid) { // checking for asteroids------------------------
          if (dist(x, y, b.location.x, b.location.y)<= 300) {
            location.x = x;
            location.y = y;
            velocity = v;
            isFound = true;
            isInvincible = true;
          }
        }
        tpcd--;
        j++;
      }
    }
    tp = false;
  }
  }
}
