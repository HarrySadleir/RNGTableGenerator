class RNGTable {
  ArrayList<Integer> die;
  int minRoll;
  int maxRoll;
  int iterations;
  ArrayList<Roll> rolls;
  RNGTable(ArrayList<Integer> die) {
    this.die=die;
    minRoll = die.size();
    iterations = 1;
    for(int i = 0; i < die.size(); i++) {
      maxRoll += die.get(i);
      iterations *= die.get(i);
    }
    
    rolls = new ArrayList<Roll>();
    for(int i = minRoll; i <= maxRoll; i++) {
      rolls.add(new Roll(i, iterations));
    }
    
    ArrayList<Integer> iteratorPrime = new ArrayList<Integer>();
    for(Integer d : die) {
      iteratorPrime.add(1);
    }
    
    //calculate table
    iterate(iteratorPrime);
    rolls.get(0).addLand();
  }
  
  void iterate(ArrayList<Integer> iterator) {
    //finds lowest unfinished index
    int index = -1;
    for(int i = iterator.size()-1; i >= 0; i--) {
      if(iterator.get(i) < die.get(i)) index = i;
    }
    
    //ends recursion if all indexes are maxed
    if(index!=-1) {
      
      //increments the current value of die
      iterator.set(index, iterator.get(index)+1);
      
      //reset earlier dice for all iterations
      for(int i = 0; i < index; i++) {
        iterator.set(i, 1);
      }
      
      //add up current iteration
      int total = 0;
      for(Integer num : iterator) {
        total+=num;
      }
      
      //find which Roll r total is, then add a land to it
      for(Roll r : rolls) {
        if(r.getValue() == total) r.addLand();
      }
      
      //recurse
      
        iterate(iterator);
      
    }
    
    //int incompleteIndex = -1;
    //for(int i = 0; i < iterator.size();i++) {
    //  if(iterator.get(i)!=die.get(i)) {
    //    incompleteIndex = i;
    //    break;
    //  }
    //}
    
    
    
  }
  
  void reset(ArrayList<Integer> dice) {
    //this = new RNGTable(dice);
  }
  
  String toString() {
    String s = "";
    for(Roll r : rolls) {
      s += ("\n"+ r.getValue() + ", " + r.getProbability());
    }
    return s;
  }
  
}