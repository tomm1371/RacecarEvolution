public class GenerateNewGeneration {
  Random rand = new Random();

  void generateNewGeneration(ArrayList<CarController> Racecar, int numOffspring, float mutationRate) {
    int numBestCars = 5;
    ArrayList<CarController> bestCars = getBestCars(Racecar, numBestCars);
    
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
    
    Racecar.clear();
    Racecar.addAll(newGeneration);
  }

  ArrayList<CarController> getBestCars(ArrayList<CarController> Racecar, int numBestCars) {
    Collections.sort(Racecar, (c1, c2) -> (int) (c2.getFitness() - c1.getFitness()));
    ArrayList<CarController> bestCars = new ArrayList<>();
    for (int i = 0; i < numBestCars; i++) {
      bestCars.add(Racecar.get(i));
    }
    return bestCars;
  }

  CarController breed(CarController parent1, CarController parent2, float mutationRate) {
    NeuralNetwork offspringNet = new NeuralNetwork();
    for (int i = 0; i < parent1.net.weights.length; i++) {
      if (rand.nextFloat() < 0.5) {
        offspringNet.weights[i] = parent1.net.weights[i];
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
