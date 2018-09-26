import processing.sound.*;
SoundFile file;
//class
Raindrop rain;
//datatypes
float Xs [] = new float [100];
float Ys [] = new float [100];
float speed[] = new float [100];
float rectY=700;
float rectH=100;
PImage bombay;
int screen = 1;
Raindrop[] thunder = new Raindrop [100];

void setup () 
{
  size (800, 800);
  //background
  bombay = loadImage ("mumbai.jpg");
  bombay.resize(800, 800);
  //song
  file = new SoundFile(this, "waves.mp3");
  file.play();
  noStroke();
  rain = new Raindrop();
  for (int i=0; i < 100; i++)
  {
    //random spawn
    Xs[i] = random(0, 800);
    Ys[i] = random(0, 800);
    //speed of raindrops
    speed[i]=random(2, 5);
    thunder[i] = new Raindrop();
  }
}

void draw ()
{
  //screen 1
  if (screen == 1)
  {
    //movement and rendering of raindrops
    background(bombay);
    rain.Render();
    rain.Move();
    //water level rises
    if (millis()>5000)
    {
      fill (0, 0, 255);
      rect (0, rectY, 800, rectH);
      rectY=rectY-0.5;
      rectH=rectH+0.5;
    }
    if (rectY==100)
    {
      rectY = rectY +0.5;
      //screen 2
      screen = 2;
    }

    for (int i=0; i < 100; i++)
    {
      thunder[i].Render();
      thunder[i].Move();
      //color of raindrops
      fill(0, 0, 255);
      ellipse(Xs[i], Ys[i], 15, 15);
      //left.right movement of raindrops
      Ys[i] = Ys[i] + 2;
      if (key ==CODED)
      {
        if (keyCode == RIGHT)
        {
          Xs[i] = Xs[i] +speed[i];
        }
        if (keyCode == LEFT)
        {
          Xs[i] = Xs[i] - speed[i]*3;
        }
      }

      //raindrop repeating
      if (Ys[i] > height)
      {
        Ys[i] = 0;
        Xs[i] = random(width);
      }
    }
    //drainage of water
  } else if (screen == 2)
  {
    background (bombay);
    fill (0, 0, 255);
    rect (0, rectY, 800, rectH);
    rectY = rectY  + 1;
    rectH = rectH +1;
  }
}
