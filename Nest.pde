//In Korea, the belly of a mother with a baby is sometimes called a baby house. 
//I have compared such a baby house to a bird's nest. Two circular nests are expressed 
//as flexible spaces that respond to sound.
class Nest {
  float  angle;  
  Nest() {
  }

  void display() {    
    for (int i = 0; i < player.left.size()-1; i++) {    
      angle = radians(i*360/360);//declare radial(circle) shape of sound visualizer.
      point(width/2 + 80*cos(angle)*(4-1.5*player.left.get(i)), height/2 + 80*sin(angle)*(4-1.5*player.left.get(i)));
    }//outside circle
    for (int i = 0; i < player.left.size()-1; i++) {
      angle = radians(i*360/360);
      point(width/2 + 40*cos(angle)*(4-1.5*player.left.get(i)), height/2 + 40*sin(angle)*(4-1.5*player.left.get(i)));
    }//inner circle
  }
}
