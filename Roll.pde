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
  
  void addLand() {
    lands++;
  }
  
  void calcProbability() {
    probability=(float) lands/iterations;
  }
  
  float getProbability() {
    return probability;
  }
  
  int getLands() {
    return lands;
  }
  
  int getValue() {
    return value;
  }
}