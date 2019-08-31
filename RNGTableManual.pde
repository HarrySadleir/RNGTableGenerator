class RNGTableManual extends RNGTable {
  
  RNGTableManual(ArrayList<Integer> die){
    super(die);
    
    super.iterations = 0;
    
    super.rolls = new ArrayList<Roll>();
    for (int i = super.minRoll; i <= super.maxRoll; i++) {
      super.rolls.add(new Roll(i, 0));
    }   
  }
  
  void iterate(){}
  
  //adds roll where minRoll<=n<=maxRoll
  void update(int n) {
    for (Roll r : super.rolls) {
        if (r.getValue() == n) {
          r.addLand();
          r.addIteration();
        }
    }
  }
}