abstract class RNGTable {
  private ArrayList<Integer> die;
  private int minRoll;
  private int maxRoll;
  private int iterations;
  private ArrayList<Roll> rolls;

  RNGTable(ArrayList<Integer> die) {
    this.die=die;
    minRoll = die.size();
    for (int i = 0; i < die.size(); i++) {
      maxRoll += die.get(i);
    }
  }
  
  //a way to iterate over the dice to get probability
  abstract void iterate();
  
  //returns String value of the table
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
    for (Roll r : rolls) {
      maxProb = max(r.getProbability(), maxProb);
    }

    //calculate grid scale
    float scale = .05;
    if (maxProb < .02) scale = .002;
    else if (maxProb < .05) scale = .005;
    else if (maxProb < .10) scale = .01;
    else if (maxProb < .20) scale = .02;
    
    //bar graph and bar label
    maxProb*=1.05;
    fill(0);
    stroke(255);
    textSize(min(w/2, 25));
    for (int i = 0; i < rolls.size(); i++) {
      float h = map(rolls.get(i).getProbability(), 0, maxProb, 0, height);

      fill(0);
      rect(i*w, height, w, -h);
      fill(255);
      text(rolls.get(i).getValue(), i*w+w/3, .99*height);
    }




    //display grid
    stroke(255);
    for (int i = 1; i < 10; i++) {
      float scaleH = scale/maxProb*height;
      strokeWeight(1);
      line(0, height-i*scaleH, width, height-i*scaleH);
      text((ceil((i)*scale*100)) + "%", width/50, height-i*scaleH);
    }
  }

  void display(float x, float wid) {
    //calculate scale based of the highest probability
    float w = (float) wid/rolls.size();
    float maxProb = 0;
    for (Roll r : rolls) {
      maxProb = max(r.getProbability(), maxProb);
    }
    
    //calculate grid scale
    float scale = .05;
    if (maxProb < .02) scale = .002;
    else if (maxProb < .05) scale = .005;
    else if (maxProb < .10) scale = .01;
    else if (maxProb < .20) scale = .02;
    
    //bar graph and bar label
    maxProb*=1.05;
    fill(0);
    stroke(255);
    strokeWeight(1);
    textSize(min(w/2, 25));
    for (int i = 0; i < rolls.size(); i++) {
      float h = map(rolls.get(i).getProbability(), 0, maxProb, 0, height);

      fill(0);
      rect(x+i*w, height, w, -h);
      fill(255);
      text(rolls.get(i).getValue(), x+i*w+w/3, .99*height);
    }

    


    //display grid
    displayGrid(x, wid, scale, maxProb);
  }
  
  void displayGrid(float x, float wid, float scale, float maxProb) {
    stroke(255);
    for (int i = 1; i < 10; i++) {
      float scaleH = scale/maxProb*height;
      strokeWeight(1);
      line(x, height-i*scaleH, x+wid, height-i*scaleH);
      
      //
      float value = (i)*scale*100;
      if(value%1>.5) value += 1;
      
      text((int) value + "%", x + width/50, height-i*scaleH);
    }
    
  }
}