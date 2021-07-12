//It depicts the baby swimming in the mother's belly.

class Fetal {//Object on time based motion(to-and-fro motion)

  PImage fetalImg;
  float ypos=300;
  int val =0; //control the y position for to-and-fro motion.
  
  Fetal(PImage _fetalImg) {
    fetalImg =_fetalImg;
     } 
  //Activate a class object using the class constructor.
  void display() {
    image(fetalImg, 280, ypos, 240, 253);
    if (val==0) {
      ypos=ypos-0.5;
    } else if (val==1) {
      ypos=ypos+0.5;
    }
    if (ypos==250) {
      val =1;
    } else if (ypos==height/2-100) {
      val=0;
    }
  }//display end
}//classFetal end
