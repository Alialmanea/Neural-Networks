// The activation function
int sign(float n){
  if (n >= 0)
  return 1;
  else
  return -1;
}
// f(x) = m * x + 2
float f(float x){ 
    return 0.89 * x - 0.1;
  }
  
class Perceptron{
  float[] weights;
  float lr = 0.001;
  
  Perceptron(int n){
    weights= new float[n];
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
  
  float guessY(float x){
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return (- (w2/w1) - (w0/w1) * x);
  }

}

class Point{
  float x;
  float y;
  float bais = 1;
  int label;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  Point(){
    this.x = random(-1, 1);
    this.y = random(-1, 1);
    float lineY = f(x);
    if (x > lineY){
      this.label = 1;
    }else{
      this.label = -1;
    }
  }
  
  float getpointX(){
    return map(x,-1, 1, 0, width);
    
  }
  
  float getpointY(){
    return map(y,-1, 1, height, 0); 
  }
  void show(){
    stroke(0);
    if (this.label == 1){
      fill(255);
    }else{
      fill(0);
    }
    
    ellipse(getpointX(), getpointY(), 14, 14);
  }
}



Perceptron brian;
Point[] points = new Point[100];
int trainingindex = 0;
void setup(){
  size(600, 600);
  brian = new Perceptron(3);
  // initialize The point class
  for (int i = 0;i < points.length;i++){
    points[i] = new Point();
  }
}

void draw(){
  background(255);
  stroke(0);
  //line(0, width, height , 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.getpointX(), p1.getpointY(), p2.getpointX(), p2.getpointY());
  
  // moving line
  Point p3 = new Point(-1, brian.guessY(-1));
  Point p4 = new Point(1, brian.guessY(1));
  
  line(p3.getpointX(), p3.getpointY(), p4.getpointX(), p4.getpointY());
  
  
  for (Point p : points){ // draw the data as cricle 
   p.show(); 
  }
  
  for (Point p : points){ //
    float[] inputs = {p.x, p.y, p.bais};
    int target = p.label;
    int guess = brian.guess(inputs);
    if (guess == target){
      fill(0, 255, 0);
    }else{
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(p.getpointX(), p.getpointY(), 8, 8);
  }
  Point tarining = points[trainingindex];
  float[] inputs = {tarining.x, tarining.y, tarining.bais};
  int target = tarining.label;
  brian.train(inputs, target);
  trainingindex++;
  if (trainingindex ==points.length){
    trainingindex = 0;
  }
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}       
