class Fitness {
    int whiteSensor;
 
    float[] score  = new float[populationSize];  

  float fitnessUpdate(SensorSystem s, float r) {
        if (s.whiteSensorFrameCount == 0) r = s.clockWiseRotationFrameCounter;
        else r = 0;
        return r;
    }
    
    //printing fitness scores on screen
    void drawFitness(ArrayList<CarController> car){
            int j = 0;
      for (CarController controller : car) {
        score[j] = car.get(j).fitnessCar;
        j++;
      }
      
      sortDescending(score);
      //set font
      textSize(16);
        fill(0, 408, 612);
        text("Fitness scores:", 1020, 20);
      
      //Print scores
      for (int i = score.length - 1; i >= 0; i--) { 
        //remove negative scores
        if (score[i]<0) score[i] = 0;
        //print fist 50 scores in first column and remaning 50 in second column
        if(i>49){
        textSize(16);
        fill(0, 408, 612);
        text(int(score[i]), 1100, 40 + 18*i-900);
        } else{
        textSize(16);
        fill(0, 408, 612);
        text(int(score[i]), 1020, 40 + 18*i);
        }
      }
    }
    
    //sort decending function
    void sortDescending(float[] arr) {
    for (int i = 0; i < arr.length - 1; i++) {
        for (int j = i + 1; j < arr.length; j++) {
            if (arr[i] < arr[j]) {
                float temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
}
}
