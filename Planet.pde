public class Planet {            //defining class "Planet"
  int[] loc;                    //defining an array
  color myColor;                //declaring a variable for color
  int mySize;                   //declaring a variable for size
  int dx, dy;                   //declaring a variable for position
  String name;                  //declaring a variable for name, 
  //string is a sequence of characters

  public Planet() {              //Planet constructor?
    println("making an planet");//sends a line to console to alert you
    loc = new int[2];           //assigns a value to loc 
    assignDefaultValues();      //calls in function "assignDefaultValues();"
  }

  void assignDefaultValues() {  //decares a function "assignDefaultValues();"
    println("assigning values");//sends a line to console to alert you 
    name = "a planet";          //assigns a name to string "name"
    loc[0] = 100;              //assigns first value of loc
    loc[1] = 200;              //assigns second value of loc
    myColor = color(255, 255, 0);//assigns color
    mySize = 50;               //assigns size 
    dx = dy = 10;              //assigns both the x and y values
  }

  void drawPlanet() {           //declares a function "drawPlanet"
    fill(myColor);              //uses the above declared my color for fill
    ellipse(loc[0], loc[1], mySize, mySize);//declares the location and size 
    //of the ellipse using the above declared variables  
    if ( loc[0] + mySize / 2 >= 600 || loc[0] - mySize / 2 <= 0 ) {
      //if x value edge of the ellipse reaches the edge of the screen ...
      dx *= -1;//location x reverses?
    }
    if ( loc[1] + mySize / 2 >= 600 || loc[1] - mySize / 2 <= 0 ) {
      //if y value edge of the ellipse reaches the edge of the screen ...
      dy *= -1;
      //y value reverses
    }
    loc[0] += dx;//set array value to dx
    loc[1] += dy;//set array value to dy
    //    println(name+ " loc: " + loc[0] + ", " + loc[1]);
  }
}

public class Meteor extends Planet {
  //decalres a Meteor class that shares all properties of parent "Planet" 

  boolean followMouse;//declares a yes/no variable

  public Meteor() {//contructor for Meteor?
    super();//do what your parents do
    println("actually im a meteor");//sends message to console

    myColor = color( random(255), random(255), random(255) );

    dx = (int) random(3, 17);
    dy = (int) random(3, 17);

    followMouse = false;
  }

  void drawPlanet() {
    if ( followMouse ) {
      fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      ellipse(loc[0], loc[1], mySize, mySize);
    }
    else {
      super.drawPlanet();
    }
  }
}

