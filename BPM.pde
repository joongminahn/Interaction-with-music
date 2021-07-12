//Instead of crossing the middle of the screen, the BPM sign was placed at the top and bottom
//to draw attention to the fetal and components in the screen.

class BPM{
  AudioPlayer Player; 
  BeatDetect beat;
  FFT fft; //Fast Fourier Transform
  PImage uIImg;
  PImage dinoImg;
  PImage dino2Img;  
  float bg;  
  BPM(PImage _uIImg, PImage _dinoImg, PImage _dino2Img, AudioPlayer _Player){
    uIImg=_uIImg;
    dinoImg=_dinoImg;
    dino2Img=_dino2Img;
    
    Player=_Player;
       
    fft = new FFT(Player.bufferSize(), Player.sampleRate());
  //a storage function and sample that enables stable transmission of sound data  
    beat = new BeatDetect(Player.bufferSize(), Player.sampleRate());
  // the size variations respond to sound beats.  
    Player.play();    
  }  
  //Activate a class object using the class constructor.
  void display(){
   beat.detect(Player.mix);
   fft.forward(Player.mix);
   if (beat.isSnare()==true) {
    bg =50;
  }
  background(0,0,bg);
  bg *= 0.98;
  //boolean isSnare(): In frequency energy mode this returns true if a beat corresponding
  //to the frequency range of a snare drum has been detected.
  //-->background color tone is changed continuously to the sound beat.
  
   for(int i =0; i<Player.bufferSize()-1;i++){ 
      line(i,65+Player.left.get(i)*80, i+1, 70+Player.left.get(i+1)*80);
      line(i,725+Player.right.get(i)*80,i+1,730+Player.right.get(i+1)*80);
    }
    //The AudioBuffer containing the left and right channel samples.
    //+ control the sound amplitude
    image(uIImg,24,16);
    image(dinoImg,710,587,90,101);
    image(dino2Img,110,60,100,90);
  }

}//classBPMend

void keyPressed() { 
  if ( key == 'm'|| key == 'M' ) { 
    if ( player.isMuted() ) { 
      player.unmute();
    } 
    else { 
      player.mute();
    }
  }
}//keyPressed function to mute sound 
