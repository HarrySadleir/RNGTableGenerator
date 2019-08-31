class RNGTableBF extends RNGTable {

  RNGTableBF(ArrayList<Integer> die) {
    super(die);

    super.iterations = 1;
    for (int i = 0; i < super.die.size(); i++) {
      super.iterations *= super.die.get(i);
    }

   super.rolls = new ArrayList<Roll>();
    for (int i = super.minRoll; i <= super.maxRoll; i++) {
      super.rolls.add(new Roll(i, super.iterations));
    }    
    
    //calculate table
    iterate();
  }

  //trigger recursion
  void iterate() {
    ArrayList<Integer> iteratorPrime = new ArrayList<Integer>();
    for (Integer d : super.die) {
      iteratorPrime.add(1);
    }



    iterate(iteratorPrime);
    super.rolls.get(0).addLand();
  }

  //recursive method to assign how many times a given possible roll is landed on, refered to as lands
  private void iterate(ArrayList<Integer> iterator) {
    //finds lowest unfinished index
    int index = -1;
    for (int i = iterator.size()-1; i >= 0; i--) {
      if (iterator.get(i) < super.die.get(i)) index = i;
    }

    //ends recursion if all indexes are maxed
    if (index!=-1) {

      //increments the current value of die
      iterator.set(index, iterator.get(index)+1);

      //reset earlier dice for all iterations
      for (int i = 0; i < index; i++) {
        iterator.set(i, 1);
      }

      //add up current iteration
      int total = 0;
      for (Integer num : iterator) {
        total+=num;
      }

      //find which Roll r total is, then add a land to it
      for (Roll r : super.rolls) {
        if (r.getValue() == total) r.addLand();
      }

      //recurse   
      iterate(iterator);
    }
  }
}