//imports
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100;  
float     mutationRate    = 0.05;

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);
Fitness fitness = new Fitness();

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(1400, 1000);
  trackImage = loadImage("track2.png");
}

void draw() {
  clear();
  fill(255);
  rect(0,50,1000,1000);
  image(trackImage,0,0);  

  carSystem.updateAndDisplay();
  
  
  //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
  /* if (frameCount%200==0) {
      println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
      for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        if(s.whiteSensorFrameCount > 0){
          carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
         }
      }
    }*/
    //
}
