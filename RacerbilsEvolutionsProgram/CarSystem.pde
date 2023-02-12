class CarSystem {
  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser
  
  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();
  GenerateNewGeneration  generateNewGeneration = new GenerateNewGeneration();
  Fitness fitness = new Fitness();
  float test;
  int timer = 0; // A counter to keep track of the time
  int timeInterval = 600; // The time interval in seconds after which to call the generateNewGeneration method
  int numOffspring = 100;
  float mutationRate = 0.1;
  
  CarSystem(int populationSize) {
    for (int i=0; i<populationSize; i++) { 
      CarController controller = new CarController();
            
      CarControllerList.add(controller);
    }
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    for (CarController controller : CarControllerList) {
      controller.update();
      controller.display();
    }
    fitness.drawFitness(CarControllerList);

    // 2.) Check the time interval
    timer++;
     if (timer >= timeInterval) {
      timer = 0;
      generateNewGeneration.generateNewGeneration(CarControllerList, numOffspring, mutationRate);
    } 
  }
}
