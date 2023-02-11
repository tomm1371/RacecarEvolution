public class GenerateNewGeneration {
  Random rand = new Random();

  void generateNewGeneration(ArrayList<CarController> racecar, int numOffspring, float mutationRate) {
    int numBestCars = 5;
    ArrayList<CarController> bestCars = getBestCars(racecar, numBestCars);
    
    ArrayList<CarController> newGeneration = new ArrayList<>();
    for (int i = 0; i < numBestCars; i++) {
      newGeneration.add(bestCars.get(i));
    }

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
    NeuralNetwork offspringNet = new NeuralNetwork();
    for (int i = 0; i < parent1.net.weights.length; i++) {
      if (rand.nextFloat() < 0.5) {
        offspringNet.weights[i] = parent1.x1;
      } else {
        offspringNet.weights[i] = parent2.net.weights[i];
      }
      if (rand.nextFloat() < mutationRate) {
        offspringNet.weights[i] += rand.nextGaussian();
      }
    }
    for (int i = 0; i < parent1.net.biases.length; i++) {
      if (rand.nextFloat() < 0.5) {
        offspringNet.biases[i] = parent1.net.biases[i];
      } else {
        offspringNet.biases[i] = parent2.net.biases[i];
      }
      if (rand.nextFloat() < mutationRate) {
        offspringNet.biases[i] += rand.nextGaussian();
      }
    }
    return new CarController(offspringNet);
  }
}
