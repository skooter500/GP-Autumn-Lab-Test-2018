void setup()
{
  size(500, 500);
}

void drawLadder(float x, float y, float w, float h, int steps)
{
  line(x, y, x, y - h);
  line(x + w, y, x, y - h);
  float gap = h / (steps + 1);
  for(int i = 0 ; i < steps ; i ++)
  {
    float gy = (y - gap) - (i * gap);
    line(x, gy, x + w, gy); 
  }
}

void draw()
{
  background(0);
  stroke(255);
  drawLadder(50, 400, 50, 100, 10);
}