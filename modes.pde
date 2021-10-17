// game function--------------------------------------------------------
void game(){
  strokeWeight(4);
   myShip.show();
   myShip.act();
  
  // display and act bullets
  int i=0;
  while(i<Bullets.size()){
     gameObjects b = Bullets.get(i);
     b.show();
     b.act();
     if(b.lives==0){
     Bullets.remove(i); 
     }else{
     i++;
     } 
  }
}
 // start screen ======================================================
void startMenu(){
    //Bullets.get(Bullets.indexOf(g)).show();

    g.show();
    stroke(0);
    strokeWeight(10);
     fill(255);
  stroke(255);
  textSize(100);
  text("Asteroids!",width/2,height/3);
  fill(#EFF08F);
  
    if(mode == start && mouseX>=width/2-150 && mouseX<=width/2+150 && mouseY>=height/2+150 && mouseY<=height/2+250){
    stroke(255);
}else{
    stroke(0);
}   
 
    rect(width/2-150,height/2+150,300,100);
  fill(0);
  textSize(60);
  text("play",width/2,height/2+180);
    textFont(font);
    textAlign(CENTER,CENTER);
  strokeWeight(25);
  
}
// pause framework=====================================================
void pause(){
    textFont(font);
    textAlign(CENTER,CENTER);
  strokeWeight(25);
  stroke(255);
  textSize(100);
  text("Paused",width/2,height/3);
}
 // end framework=======================================================
void end(){
  g.show();
  textFont(font);
  textAlign(CENTER,CENTER);
  strokeWeight(25);
  fill(255);
  stroke(255);
  textSize(40);
  if(score >= 9){
  text("YOU WIN!",width/2,height/2);text("Score: "+score,width/2,height/2+75); }
  else{text("YOU LOST",width/2,height/2);text("Score: "+score,width/2,height/2+75);}

}
