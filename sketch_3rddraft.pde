
int n=12;   // number of robots
int start;  // create integer for clock
int m = 0;  // to keep track of how many robots met
float r = 250;  // radius
float d =360/n;    // to keep equal distance
float divide=0;    // to keep equal distance starts from 0;
//int firstTime=0;   
int k;           // random integer to check what direction the robot will go in
//int[] robotDirection = new int[n];        // array of the n number of robots that we wanted
Robot[] robots;                     //array of robots
int counter=0;

void setup() {
  size(600, 600);     //size of window
 // rectMode(CENTER);  
  //ellipseMode(RADIUS);
  noFill();            
  stroke(255);    // to make white robots and circle
  smooth();           
  start = millis();   //clock
  robots = new Robot[n];     // initialize robots with size n
  float basicA;
  basicA=frameCount*1f;   
  for (int i = 0; i < n; i++) {    
     
      k = (int)random(2);      // we use this as a coin flip
      
    
      float angle = basicA+i*0.1f;            
    robots[i] = new Robot(cos(radians(angle+divide)) *r, sin(radians(angle+divide)) *r, k , i,round( cos(radians(angle+divide)) *r), round(sin(radians(angle+divide)) *r));   //creates instances of robots
   //print(robots[i].y,"    ",robots[i].x,"\n");
   
    //println(robots[0].x);
    divide=divide+d;  // keep equal distance between robots
}
//firstTime++;
}



class Robot{
  float basicA;
  float x;
  float y;
  int size=30;    //size of robots
  int dir;       //direction they will travel in
  int i;
  
  float initialPositionX;    //|where it completes a circle 
  float initialPositionY;
  Robot(float a, float b, int direction, int number, float initialPosX, float initialPosY){   //constructor
    initialPositionX=initialPosX;
    initialPositionY=initialPosY;                              
    i=number;                                               //initializing variables
    x=a;
    y=b;
    dir=direction;
    }
  
  
  
 void update(){
   
 //  println(basicA);
   float angle = basicA; // keeps distance between balls
   if(dir==0){
    basicA+=.25;          //speed and direstion
    
    }else{
      basicA-=.25;         //speed and direction
      
    }
    
    float x = cos(radians(angle+divide)) *r;      // creates x pos
    float y = sin(radians(angle+divide)) *r;     // creates y pos
 
    
    divide=divide+d;            // maintain distance
    robots[i].x=x;           // give robot i xpos
    robots[i].y=y;           // give robot i y pos
 
 
    
}


  
  

  
  
  
  void display(){

     
for(int i=0; i<n; i++){                                            //for all the robots we have wanted, this function displays them.
  //println(robots[1].y);
  ellipse(robots[i].x, robots[i].y, size, size);                   //cicle robots
 /*textSize(32);
  text(i,robots[i].x,robots[i].y);*/
  
}


 

}  
  
  
  
  
  void collision(){
    
   
    
       for(int i =0; i<n; i++){
      if(round(robots[i].y) == robots[i].initialPositionY  && round(robots[i].x) == robots[i].initialPositionX ){              //checks if a robot has reached the same spot again without meeting another robot
      //  println(i);  
   //    if(i==0){println("pop");}
    //    if(i==1){println("0");}
     //  if(i==2){println("2");}
   robots[i].dir=(int)random(2);        //coin flip
   
      }
   }
    
    for(int i=0; i<n; i++){
      for(int k=0; k<n; k++){
        if( round(robots[i].y*10)==round(robots[k].y*10) && round(robots[i].x)==round(robots[k].x) ){                 //checks if two robots have met one another
          if(robots[i].dir != robots[k].dir){              //checks if they have met the first time
            robots[i].dir=robots[k].dir = (int)random(2);
            robots[i].initialPositionX=robots[i].x;                //sets robot k to be with robot i
            robots[i].initialPositionY=robots[i].y;
            robots[k].initialPositionX=robots[i].x;
            robots[k].initialPositionY=robots[i].y;
            
            counter+=1;                                             //counter to check whether robot has met before 
            println(counter);
            if(counter==(n-1)){stop();}
            
            
          
          }
         
       
      }
     
    }
    
   
    }
    
    
    
          
      
  }
    
    

  
  
  }
    












void draw() {               //function keeps looping
  background(0);
  int timer = millis()-start;         //clock
  ellipse(width/2, height/2, 2*r, 2*r);    //ring
  translate(width/2, height/2);   //robots fall on ring
  text(timer/1000, 0, 0);            //to measure time in seconds
  
  
  for (Robot robot : robots) {              //runs loop 
    robot.update();
    robot.display();
    robot.collision();
    //noLoop();
  }
//noLoop();
}