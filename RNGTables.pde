final int diceSelect = 0;
final int table = 1;
int mode = 0;
RNGTable t;

void setup() {
  size(600, 600);
  
  ArrayList<Integer> die = new ArrayList<Integer>();
  die.add(10);
  die.add(10);
  
  

  t = new RNGTable(die);
  
  
  println(t);
}

void draw() {
  background(100);
  //if(mode == diceSelect) diceSelection();
  //else if(mode == table) showTable();
  //else println("Mode out of bounds");
  
  
  t.display();
  
}