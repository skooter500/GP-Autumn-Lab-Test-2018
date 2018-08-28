void setup()
{
  size(500, 500);
}

void drawLadder(float x, float y, float w, float h, int steps)
{
  line(x, y, x, y - h);
  line(x + w, y, x + w, y - h);
  float gap = h / (steps + 1);
  for(int i = 0 ; i < steps ; i ++)
  {
    float gy = (y - gap) - (i * gap);
    line(x, gy, x + w, gy); 
  }
}

void drawKey(float x, float y)
{  
  float w = 10;
  ellipse(x, y, w, w);
  float c = x;
  float h = y + w * 3;
  line(c, y + w / 2, c, h);
  line (c, h - 5, c - 5, h - 5);
  line (c, h - 10, c - 5, h - 10);
  line (c, h - 15, c - 5, h - 15);
}

void drawPlayer(float x, float y, float w, boolean happy)
{
  ellipse(x, y, w, w);
  ellipse(x - 10, y - 10, 5, 5);
  ellipse(x + 10, y - 10, 5, 5);
  ellipse(x, y, 5, 5);
  line(x - 10, y + 10, x + 10 , y + 10);
  if (happy)
  {
    line(x-10, y + 10, x-13, y + 2);
    line(x+10, y + 10, x+13, y + 2);    
  }
  else
  {
    line(x-10, y + 10, x-13, y + 15);
    line(x+10, y + 10, x+13, y + 15);    
  }
}

float lx = 200, ly = 400, lw = 60;
float kx = 225, ky = 150;
float px = 50, py = 375;

void keyPressed()
{
  if (keyCode == LEFT)
  {
    px --;
  }
  if (keyCode == RIGHT)
  {
    px ++;
  }
  if (keyCode == UP && px > lx + 25 && px < lx + lw - 25)
  {
    py --;
  }
}

boolean happy = false;

void draw()
{
  background(0);
  stroke(255);
  noFill();
  line(0, 400, width, 400);
  drawLadder(lx, ly, lw, 200, 10);
  if (! happy)
  {
    drawKey(kx, ky);
  }
  drawPlayer(px, py, 50, happy);
  
  float d = dist(px, py, kx, ky);
  if (d < 50)
  {
    happy = true;
  }
  
}