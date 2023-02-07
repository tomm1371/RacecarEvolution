class CarSystem {
  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser
  
  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();
  ArrayList<Float> FitnessList  = new ArrayList<Float>();
  Fitness fitness = new Fitness();
  float test;
  
  CarSystem(int populationSize) {
    for (int i=0; i<populationSize; i++) { 
      CarController controller = new CarController();
            
      CarControllerList.add(controller);
     // FitnessList.add(fitness.fitnessScore());
    }
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    for (CarController controller : CarControllerList) {
      controller.update();
      controller.display();
    }
    fitness.drawFitness(CarControllerList);
  }
}
