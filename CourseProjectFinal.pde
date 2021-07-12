import ddf.minim.analysis.*;//includes FFT, Beat Detection
import ddf.minim.*; 
import ddf.minim.ugens.*;//a real-time synthesis framework
// sound generators, effects and so on
import ddf.minim.effects.*;
Minim minim;
AudioPlayer player; 
BeatDetect beat;
FFT fft; //Fast Fourier Transform
//-------------------import and declare minim library and the features------------------------------------------------------

PImage uIImg;
PImage dinoImg;
PImage dino2Img;
PImage fetalImg;
int num = 200;//declare the number of cell objects 
Fetal myfetal; //Just declare the object here
BPM myBPM;
Nest myNest=new Nest();
Cell[] myCell = new Cell[num];//declared an array to make numerous cells

//-------------------------------------call classes-------------------------------------------------------------------------
void setup() { 
  size(800, 800, P3D);
  uIImg=loadImage("uI.png");
  dinoImg=loadImage("dino.png");
  dino2Img=loadImage("dino2.png");
    
  minim = new Minim(this); 
  player = minim.loadFile("Mozart.mp3"); 
  myBPM= new BPM(uIImg, dinoImg, dino2Img, player);  
  fetalImg=loadImage("fetal.png"); 
  myfetal = new Fetal(fetalImg); 
//  
  for (int i =0; i <num; i++)//1-200  
  {
    myCell[i] = new Cell(color(random(255)), random(0, 12), random(0.0007, 0.001));
  }
  //allocate multiple circles' size and rotation speed
  } 

void draw() { 
  background(0);
  stroke(#4444bb);
  strokeWeight(2);
  myBPM.display();
  myNest.display();  
  for (int i =0; i < num; i++)
    //as using for loop function, duplicate cells which are composed with
    //each feature in the function at one time. 
  {
    myCell[i].add_circleSize = myBPM.fft.getBand(i)/20+2; 
    //Returns the amplitude of the requested frequency band.
    myCell[i].add_num = i;
    myCell[i].b =  myCell[i].b + myBPM.fft.getBand(i)/200;
    myCell[i].mix_level = player.mix.level()*10;
    //tuning sound pressure that affects the sound response of objects
    //for second ellipse to respond to music with size from the first ellipse.
    myCell[i].display();
    myCell[i].drive();
  }
  myfetal.display();
}//draw end
