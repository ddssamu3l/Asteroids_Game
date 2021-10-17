class gif {
  PImage image [];
  int frameCounter;
  int b;

  gif(int frameNum, String name) {
    b=0;
    image = new PImage [frameNum];
    frameCounter = 0;
   
    if (name.equals("starting screen gif")) {
      for (int x = 0; x<image.length; x++) {

        image[x] = loadImage("frame_"+x+"_delay-0.04s.gif");
      }
    }
    else if (name.equals("end screen gif")) {
      for (int x = 0; x<image.length; x++) {

        image[x] = loadImage("frame_"+x+"_delay-0.1s.gif");
      }
    }
  }

  void show() { 
    frameCounter=frameCounter+1;
    if (frameCounter>=image.length) {
      frameCounter=0;
    }
    image(image[frameCounter], width/2, height/2,width,height); 
  }

}
