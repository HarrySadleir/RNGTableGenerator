final int diceSelect = 0;
final int table = 1;
final int randTable = 2;
final int comparison = 3;
int mode = comparison;
RNGTable t1;
RNGTable t2;

void setup() {
  size(800, 800);
  
  ArrayList<Integer> die = new ArrayList<Integer>();
  die.add(6);
  die.add(8);
  die.add(12);
  

  t1 = new RNGTableBF(die);
  t2 = new RNGTableRoll(die, 100000);
  
  
  
  println(t2);
}

void draw() {
  background(100);
  if(mode == diceSelect) diceSelection();
  else if(mode == table) showTable();
  else if(mode == randTable) showRandTable();
  else if(mode == comparison) showComparison();
  else println("Mode out of bounds");
  
  
  
  
}

void diceSelection() {
  
}

void showTable() {
  t1.display();
}

void showRandTable() {
  t2.display();
}

void showComparison() {
  t1.display(0, width/2);
  t2.display(width/2, width/2);
  
  strokeWeight(5);
  line(width/2, 0, width/2, height);
}