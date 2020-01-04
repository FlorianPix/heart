import java.nio.file.*;

ArrayList<PVector> leaf;
ArrayList<Auxin> hormones;
int spawnrate = 3;
VeinTree veinTree;

float a;
int counter;
boolean record;
float percent = 1.001;

void setup(){
  size(640,640);
  counter = 0;
  record = false;
  leaf = read_leaf_outline();
  veinTree = new VeinTree(new PVector(width/2, 4 * height / 5));
}

void draw(){
  // ######## BEFORE ########
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  
  // ####### MAIN ###########
  // Draw Leaf
  beginShape();
  for (PVector v : leaf){
    vertex(v.x, v.y);
  }
  endShape();
  // Draw Hormones
  hormones = spawn(spawnrate);
  for (Auxin a : hormones){
    stroke(150, 0, 0);
    circle(a.co.x, a.co.y, 1);
  }
  
  // Draw VeinTree
  veinTree.grow(hormones);
  veinTree.drawTree();
  
  
  // ########AFTER###########
  
  if (record){
    saveFrame("output/gif-" + counter + ".png");
  }
  leaf = scale_leaf(percent);
  counter++;
}
