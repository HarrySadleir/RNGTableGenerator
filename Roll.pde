class Roll {
  private int value, iterations, lands;
  private float probability;
  Roll(int value, int iterations) {
    this.value = value;
    //this.probability = probability;
    this.iterations = iterations;
    lands = 0;
    probability = 0;
  }
  
  //add and instance where this number was landed on, refered to as a land
  void addLand() {
    lands++;
  }
  
  void calcProbability() {
    probability=(float) lands/iterations;
  }
  
  //return percentage form of probability
  String toString() {
    calcProbability();
    return (probability*100) + "%";
  }
  
  //return decimal form of probability
  float getProbability() {
    calcProbability();
    return probability;
  }
  
  //return number of times this number was landed on, refered to as lands
  int getLands() {
    return lands;
  }
  
  //return number being rolled
  int getValue() {
    return value;
  }
}