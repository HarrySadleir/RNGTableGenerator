class RNGTableRoll extends RNGTable {
  private int n;
 
  RNGTableRoll(ArrayList<Integer> die, int n) {
    super(die);
    this.n = n;

    super.rolls = new ArrayList<Roll>();
    for (int i = super.minRoll; i <= super.maxRoll; i++) {
      super.rolls.add(new Roll(i, n));
    }   
    
    iterate();
  }
  
  void iterate() {
    for(int i = 0; i < n; i++) {
      int total = 0;
      
      //roll each die
      for(Integer a : super.die) {
        total += (int) random(1, a+1);
      }
      
      //find which Roll r total is, then add a land to it
      for (Roll r : super.rolls) {
        if (r.getValue() == total) r.addLand();
      }
    }
    
  }
  
}