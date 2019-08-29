final int diceSelect = 0;
final int table = 1;
int mode = 0;

void setup() {
  size(600, 600);
  
  ArrayList<Integer> die = new ArrayList<Integer>();
  die.add(4);
  die.add(4);
  die.add(6);

  RNGTable t = new RNGTable(die);
  
  
  println(t);
}

void draw() {
  background(0);
  if(mode == diceSelect) diceSelection();
  else if(mode == table) showTable();
  else println("Mode out of bounds");
}

void diceSelection(){
  //int 
  
}

void showTable() {
  
}