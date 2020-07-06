
// The activation function
int sign(float n){
  if (n >= 0)
  return 1;
  else
  return -1;
}
  
class Perceptron{
  float[] weights= new float[2];
  float lr = 0.1;
  Perceptron(){
    for(int i = 0;i<weights.length;i++){
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs){
    float sum = 0;
    for (int i =0; i < weights.length; i++){
      sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error= target - guess;
    
    for (int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }

}

class Point{
  float x;
  float y;
  int label;
  
  Point(){
    this.x = random(width);
    this.y = random(height);
    if (x > y){
      this.label = 1;
    }else{
      this.label = -1;
    }
  }
  void show(){
    stroke(0);
    if (this.label == 1){
      fill(255);
    }else{
      fill(0);
    }
    ellipse(x, y, 14, 14);
  }
}



Perceptron brian;
Point[] points = new Point[100];
int trainingindex = 0;
void setup(){
  size(600, 600);
  brian = new Perceptron();
  float inputs[] = {-1,0.5};
  float output = brian.guess(inputs);
  // initialize The point class
  for (int i = 0;i < points.length;i++){
    points[i] = new Point();
  }
  println(output);
}

void draw(){
  background(255);
  stroke(0);
  line(0, 0, height, width);
  for (Point p : points){ // draw the data as cricle 
   p.show(); 
  }
  
  for (Point p : points){ //
    float[] inputs = {p.x, p.y};
    int target = p.label;
    int guess = brian.guess(inputs);
    if (guess == target){
      fill(0, 255, 0);
    }else{
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(p.x, p.y, 8, 8);
  }
  Point tarining = points[trainingindex];
  float[] inputs = {tarining.x, tarining.y};
  int target = tarining.label;
  brian.train(inputs, target);
  trainingindex++;
  if (trainingindex ==points.length){
    trainingindex = 0;
  }
  delay(80);
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}       
