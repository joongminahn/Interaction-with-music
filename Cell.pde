//The scene where prenatal music influences the growth of the fetus is expressed in a number of circles. 
//It is also expressed in fetal cells or energy, which fills the space by responding to the beat of the music.

class Cell
{   
  float xpos, ypos;//cells moving around along an orbit 
  float circleSize;
  float add_circleSize;
  //these vary each cell sizes to respond to sound beat   
  float speed;
  float speed_a = 2;
  //express the speed that multiple ellipses have
  float b = 0;
  float add_num;
  float mix_level;//for second ellipse to respond to the beat with size. 
  
  Cell(color this_c, float this_circleSize, float this_speed)
  {
    circleSize = this_circleSize;
    speed = this_speed;
  } //declare the functions for circleSize and speed only in this class.
  
   void display()
  {     noStroke();
        fill(#4444bb);
        ellipse(xpos, ypos, (circleSize + add_circleSize)*1.2, (circleSize + add_circleSize)*1.2);
        fill(#6666ff);
        ellipse(xpos, ypos, (circleSize + add_circleSize)*1.2+ mix_level*10, (circleSize + add_circleSize)*1.2+ mix_level*10);
  }//two circles make an effect to respond to beat. 
  
  
  void drive()
  {//The diameter range and shapes(oval) are the way of spreading cells to edges with speed
  //Thinking of trigonometrical function//cos=x sin=y
    xpos = width/2 + cos(speed_a+(add_num)*1.01)*(add_num * sin(b)*6);
    ypos = height/2 + sin(speed_a+(add_num)*1.003)*(add_num * sin(b)*6);
    speed_a+=speed;
  }
}
