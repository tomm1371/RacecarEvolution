public class GenerateNewGeneration {
  Random rand = new Random();

  void generateNewGeneration(ArrayList<CarController> racecar, int numOffspring, float mutationRate) {
    int numBestCars = 5;
    
    ArrayList<CarController> bestCars = getBestCars(racecar, numBestCars);
    
    ArrayList<CarController> newGeneration = new ArrayList<>();
    while (newGeneration.size() < numOffspring) {
      int parent1Index = rand.nextInt(numBestCars);
      int parent2Index = rand.nextInt(numBestCars);
      CarController parent1 = bestCars.get(parent1Index);
      CarController parent2 = bestCars.get(parent2Index);
      CarController offspring = breed(parent1, parent2, mutationRate);
      newGeneration.add(offspring);
    }
     
    racecar.clear();
    racecar.addAll(newGeneration);
  }

  ArrayList<CarController> getBestCars(ArrayList<CarController> reeeeeee, int numBestCars) {
    Collections.sort(reeeeeee, new Comparator<CarController>() {
      @Override
      public int compare(CarController o1, CarController o2) {
        return Float.compare(o2.fitnessCar, o1.fitnessCar);
      }
    });
    
    ArrayList<CarController> bestCars = new ArrayList<>();
    for (int i = 0; i < numBestCars; i++) {
      bestCars.add(reeeeeee.get(i));
    }
    return bestCars;
  }

  CarController breed(CarController parent1, CarController parent2, float mutationRate) {
    CarController offSpringCar = new CarController();
    for (int i = 0; i < 8; i++) {
      if (rand.nextFloat() < 0.5) {
        offSpringCar.hjerne.weights[i] = parent1.hjerne.weights[i] ;
      } else {
        offSpringCar.hjerne.weights[i] = parent2.hjerne.weights[i] ;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (rand.nextFloat() < 0.5) {
        offSpringCar.hjerne.biases[i] = parent1.hjerne.biases[i] ;
      } else {
        offSpringCar.hjerne.biases[i] = parent2.hjerne.biases[i] ;
      }
    }
    return offSpringCar;
  }
}
