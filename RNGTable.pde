class RNGTable {
  private ArrayList<Integer> die;
  private int minRoll;
  private int maxRoll;
  private int iterations;
  private ArrayList<Roll> rolls;
  
  RNGTable(ArrayList<Integer> die) {
    this.die=die;
    minRoll = die.size();
    iterations = 1;
    for (int i = 0; i < die.size(); i++) {
      maxRoll += die.get(i);
      iterations *= die.get(i);
    }

    rolls = new ArrayList<Roll>();
    for (int i = minRoll; i <= maxRoll; i++) {
      rolls.add(new Roll(i, iterations));
    }

    ArrayList<Integer> iteratorPrime = new ArrayList<Integer>();
    for (Integer d : die) {
      iteratorPrime.add(1);
    }

    //calculate table
    iterate(iteratorPrime);
    rolls.get(0).addLand();
  }
  
  //recursive method to assign how many times a given possible roll is landed on, refered to as lands
  void iterate(ArrayList<Integer> iterator) {
    //finds lowest unfinished index
    int index = -1;
    for (int i = iterator.size()-1; i >= 0; i--) {
      if (iterator.get(i) < die.get(i)) index = i;
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
      for (Roll r : rolls) {
        if (r.getValue() == total) r.addLand();
      }

      //recurse   
      iterate(iterator);
    }
  }
  
  String toString() {
    String s = "";
    for (Roll r : rolls) {
      s += ("\n"+ r.getValue() + ", " + r);
    }
    return s;
  }

  //displays an image of RNGTable
  void display() {
    //calculate scale based of the highest probability
    float w = (float) width/rolls.size();
    float maxProb = 0;
    for(Roll r : rolls) {
      maxProb = max(r.getProbability(), maxProb);
    }
    
    //bar graph and bar label
    maxProb*=1.05;
    fill(0);
    stroke(255);
    textSize(min(w/2, 25));
    for(int i = 0; i < rolls.size(); i++) {
      float h = map(rolls.get(i).getProbability(), 0, maxProb, 0, height);
      
      fill(0);
      rect(i*w, height, w, -h);
      fill(255);
      text(rolls.get(i).getValue(), i*w+w/3, .99*height);
    }
    
    //calculate grid scale
    float scale = .05;
    if(maxProb < .02) scale = .002;
    else if(maxProb < .05) scale = .005;
    else if(maxProb < .10) scale = .01;
    else if(maxProb < .20) scale = .02;
    
    
    //display grid
    stroke(255);
    for(int i = 1; i < 10; i++) {
      float scaleH = scale/maxProb*height;
      strokeWeight(1);
      line(0, height-i*scaleH, width, height-i*scaleH);
      text((ceil((i)*scale*100)) + "%", width/50, height-i*scaleH);
    }
  }
}