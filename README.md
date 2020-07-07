# Neural-Networks

The human brain can be described as a biological neural network—an interconnected web of neurons transmitting elaborate patterns of electrical signals. Dendrites receive input signals and, based on those inputs, fire an output signal via an axon. Or something like that. How the human brain actually works is an elaborate and complex mystery, one that we certainly are not going to attempt to tackle in rigorous detail in this chapter.


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_01.png" title=""/>


The good news is that developing engaging animated systems with code does not require scientific rigor or accuracy, as we’ve learned throughout this book. We can simply be inspired by the idea of brain function.


A neural network is a “connectionist” computational system. The computational systems we write are procedural; a program starts at the first line of code, executes it, and goes on to the next, following instructions in a linear fashion. A true neural network does not follow a linear path. Rather, information is processed collectively, in parallel throughout a network of nodes (the nodes, in this case, being neurons).


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_02.png" title=""/>


Here we have yet another example of a complex system, much like the ones we examined in Chapters 6, 7, and 8. The individual elements of the network, the neurons, are simple. They read an input, process it, and generate an output. A network of many neurons, however, can exhibit incredibly rich and intelligent behaviors.


One of the key elements of a neural network is its ability to learn. A neural network is not just a complex system, but a complex adaptive system, meaning it can change its internal structure based on the information flowing through it. Typically, this is achieved through the adjusting of weights. In the diagram above, each line represents a connection between two neurons and indicates the pathway for the flow of information. Each connection has a weight, a number that controls the signal between the two neurons. If the network generates a “good” output (which we’ll define later), there is no need to adjust the weights. However, if the network generates a “poor” output—an error, so to speak—then the system adapts, altering the weights in order to improve subsequent results.

There are several strategies for learning, and we’ll examine two of them in this chapter.

Supervised Learning —Essentially, a strategy that involves a teacher that is smarter than the network itself. For example, let’s take the facial recognition example. The teacher shows the network a bunch of faces, and the teacher already knows the name associated with each face. The network makes its guesses, then the teacher provides the network with the answers. The network can then compare its answers to the known “correct” ones and make adjustments according to its errors. Our first neural network in the next section will follow this model.


<img src="implement_of_Nural_networks.gif" title=""/>


Unsupervised Learning —Required when there isn’t an example data set with known answers. Imagine searching for a hidden pattern in a data set. An application of this is clustering, i.e. dividing a set of elements into groups according to some unknown pattern. We won’t be looking at any examples of unsupervised learning in this chapter, as this strategy is less relevant for our examples.


Reinforcement Learning —A strategy built on observation. Think of a little mouse running through a maze. If it turns left, it gets a piece of cheese; if it turns right, it receives a little shock. (Don’t worry, this is just a pretend mouse.) Presumably, the mouse will learn over time to turn left. Its neural network makes a decision with an outcome (turn left or right) and observes its environment (yum or ouch). If the observation is negative, the network can adjust its weights in order to make a different decision the next time. Reinforcement learning is common in robotics. At time t, the robot performs a task and observes the results. Did it crash into a wall or fall off a table? Or is it unharmed? We’ll look at reinforcement learning in the context of our simulated steering vehicles.

This ability of a neural network to learn, to make adjustments to its structure over time, is what makes it so useful in the field of artificial intelligence. Here are some standard uses of neural networks in software today.


Pattern Recognition —We’ve mentioned this several times already and it’s probably the most common application. Examples are facial recognition, optical character recognition, etc.

Time Series Prediction —Neural networks can be used to make predictions. Will the stock rise or fall tomorrow? Will it rain or be sunny?

Signal Processing —Cochlear implants and hearing aids need to filter out unnecessary noise and amplify the important sounds. Neural networks can be trained to process an audio signal and filter it appropriately.

Control —You may have read about recent research advances in self-driving cars. Neural networks are often used to manage steering decisions of physical vehicles (or simulated ones).

Soft Sensors —A soft sensor refers to the process of analyzing a collection of many measurements. A thermometer can tell you the temperature of the air, but what if you also knew the humidity, barometric pressure, dewpoint, air quality, air density, etc.? Neural networks can be employed to process the input data from many individual sensors and evaluate them as a whole.

Anomaly Detection —Because neural networks are so good at recognizing patterns, they can also be trained to generate an output when something occurs that doesn’t fit the pattern. Think of a neural network monitoring your daily routine over a long period of time. After learning the patterns of your behavior, it could alert you when something is amiss.

This is by no means a comprehensive list of applications of neural networks. But hopefully it gives you an overall sense of the features and possibilities. The thing is, neural networks are complicated and difficult. They involve all sorts of fancy mathematics. While this is all fascinating (and incredibly important to scientific research), a lot of the techniques are not very practical in the world of building interactive, animated Processing sketches. Not to mention that in order to cover all this material, we would need another book—or more likely, a series of books.

So instead, we’ll begin our last hurrah in the nature of code with the simplest of all neural networks, in an effort to understand how the overall concepts are applied in code. Then we’ll look at some Processing sketches that generate visual results inspired by these concepts.


## The Perceptron

Invented in 1957 by Frank Rosenblatt at the Cornell Aeronautical Laboratory, a perceptron is the simplest neural network possible: a computational model of a single neuron. A perceptron consists of one or more inputs, a processor, and a single output.


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_03.png" title=""/>


A perceptron follows the “feed-forward” model, meaning inputs are sent into the neuron, are processed, and result in an output. In the diagram above, this means the network (one neuron) reads from left to right: inputs come in, output goes out.

 Simple Pattern Recognition Using a Perceptron

Now that we understand the computational process of a perceptron, we can look at an example of one in action. We stated that neural networks are often used for pattern recognition applications, such as facial recognition. Even simple perceptrons can demonstrate the basics of classification, as in the following example.


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_04.png" title=""/>


Consider a line in two-dimensional space. Points in that space can be classified as living on either one side of the line or the other. While this is a somewhat silly example (since there is clearly no need for a neural network; we can determine on which side a point lies with some simple algebra), it shows how a perceptron can be trained to recognize points on one side versus another.

Let’s say a perceptron has 2 inputs (the x- and y-coordinates of a point). Using a sign activation function, the output will either be -1 or 1—i.e., the input data is classified according to the sign of the output. In the above diagram, we can see how each point is either below the line (-1) or above (+1).

The perceptron itself can be diagrammed as follows:


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_05.png" title=""/>


We can see how there are two inputs (x and y), a weight for each input (weightx and weighty), as well as a processing neuron that generates the output.

There is a pretty significant problem here, however. Let’s consider the point (0,0). What if we send this point into the perceptron as its input: x = 0 and y = 0? What will the sum of its weighted inputs be? No matter what the weights are, the sum will always be 0! But this can’t be right—after all, the point (0,0) could certainly be above or below various lines in our two-dimensional world.

To avoid this dilemma, our perceptron will require a third input, typically referred to as a bias input. A bias input always has the value of 1 and is also weighted. Here is our perceptron with the addition of the bias:

<img src="https://natureofcode.com/book/imgs/chapter10/ch10_06.png" title=""/>


Let’s go back to the point (0,0). Here are our inputs:

0 * weight for x = 0
0 * weight for y = 0
1 * weight for bias = weight for bias

The output is the sum of the above three values, 0 plus 0 plus the bias’s weight. Therefore, the bias, on its own, answers the question as to where (0,0) is in relation to the line. If the bias’s weight is positive, (0,0) is above the line; negative, it is below. It “biases” the perceptron’s understanding of the line’s position relative to (0,0).



#### Coding the Perceptron
We’re now ready to assemble the code for a Perceptron class. The only data the perceptron needs to track are the input weights,
and we could use an array of floats to store these.

```Java
class Perceptron{
  float[] weights;
  float lr = 0.001;
  
```

The constructor could receive an argument indicating the number of inputs (in this case three: x, y, and a bias) and size the array accordingly.


```Java
Perceptron(int n){
    weights= new float[n];
    for(int i = 0;i<weights.length;i++){
      weights[i] = random(-1, 1);
    }
  }
```

A perceptron needs to be able to receive inputs and generate an output. We can package these requirements into a function called guess(). In this example, we’ll have the perceptron receive its inputs as an array (which should be the same length as the array of weights) and return the output as an integer.


```Java
int guess(float[] inputs){
    float sum = 0;
    for (int i =0; i < weights.length; i++){
      sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }
```
Presumably, we could now create a Perceptron object and ask it to make a guess for any given point.


<img src="https://natureofcode.com/book/imgs/chapter10/ch10_07.png" title=""/>


```Java
Perceptron brian;
Point[] points = new Point[100];
int trainingindex = 0;
void setup(){
  size(600, 600);
  // initialize The point class
  for (int i = 0;i < points.length;i++){
    points[i] = new Point();
  }
}
```

Did the perceptron get it right? At this point, the perceptron has no better than a 50/50 chance of arriving at the right answer. Remember, when we created it, we gave each weight a random value. A neural network isn’t magic. It’s not going to be able to guess anything correctly unless we teach it how to!

To train a neural network to answer correctly, we’re going to employ the method of supervised learning that we described in section 10.1.

With this method, the network is provided with inputs for which there is a known answer. This way the network can find out if it has made a correct guess. If it’s incorrect, the network can learn from its mistake and adjust its weights. The process is as follows:

1.Provide the perceptron with inputs for which there is a known answer.

2.Ask the perceptron to guess an answer.

3.Compute the error. (Did it get the answer right or wrong?)

4.Adjust all the weights according to the error.

5.Return to Step 1 and repeat!

Steps 1 through 4 can be packaged into a function. Before we can write the entire function, however, we need to examine Steps 3 and 4 in more detail. How do we define the perceptron’s error? And how should we adjust the weights according to this error?

The perceptron’s error can be defined as the difference between the desired answer and its guess.

ERROR = DESIRED OUTPUT - GUESS OUTPUT

The above formula may look familiar to you. In Chapter 6, we computed a steering force as the difference between our desired velocity and our current velocity.

STEERING = DESIRED VELOCITY - CURRENT VELOCITY

This was also an error calculation. The current velocity acts as a guess and the error (the steering force) tells us how to adjust the velocity in the right direction. In a moment, we’ll see how adjusting the vehicle’s velocity to follow a target is just like adjusting the weights of a neural network to arrive at the right answer.

In the case of the perceptron, the output has only two possible values: +1 or -1. This means there are only three possible errors.

If the perceptron guesses the correct answer, then the guess equals the desired output and the error is 0. If the correct answer is -1 and we’ve guessed +1, then the error is -2. If the correct answer is +1 and we’ve guessed -1, then the error is +2.

| Attempt | #1 | #2 |
| :---: | :---: | :---: |
| Seconds | 301 | 283 |


