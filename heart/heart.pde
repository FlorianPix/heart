ArrayList<PVector> heart = new ArrayList<PVector>();
float a;
int totalFrames = 120;
int counter;
boolean record;
float percent;

void setup(){
  size(640,640);
  a = 0;
  counter = 0;
  record = true;
  percent = 0;
}

void draw(){
  if (record){
    percent = float(counter) / totalFrames;
    if (counter == totalFrames-1){
      exit();
    }
  } else{
    percent = float(counter % totalFrames) / totalFrames;
  }
  render(percent);
  if (record){
    saveFrame("output/gif-" + counter + ".png");
  }
  counter++;
}

void render(float percent){
  background(0);
  translate(width/2, height/2);
  a = map(percent, 0, 0.5, 0, TWO_PI);
  noFill();
  stroke(150, 0, 50);
  strokeWeight(8);
  beginShape();
  for(PVector v : heart){
    float a = map(percent, 0, 1, 0, TWO_PI*2);
    float r = map(sin(a), -1, 1, height/50, height/45);
    vertex(r * v.x, r * v.y);
  }
  endShape();
  if (percent < 0.5){  
    float x = 16 * pow(sin(a), 3);
    float y = -(13 * cos(a) - 5 * cos(2*a) - 2 * cos(3*a) - cos(4*a));
    heart.add(new PVector(x,y));
  } else {
    heart.remove(0);
  }
}
