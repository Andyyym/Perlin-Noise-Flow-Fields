float speed = 100;
float constant = 0.005;
ArrayList<Particle> particles = new ArrayList();

void setup() 
{
  colorMode(HSB);
  size (1920, 1080);
  background(0);

}


void draw()
{
for (Particle p : particles)
{
  p.update();
}


if(keyPressed)
{
  for (int w =0; w < 100; w++){
      particles.add(new Particle(random(width),random(height)));
  }
  //save("img.png");
}
  
  
}

class Particle
{
  PVector position;
  PVector velocity;
  float noiseValue;
  
  Particle(float X, float Y)
  {
    position = new PVector(X, Y);
    velocity = new PVector(0, 0);
  }
  
  void update()
  {
    if(position.x > 0 & position.x < width & position.y > 0 & position.y < height)
    {
    noiseValue = noise(position.x * constant, position.y * constant);
    velocity = PVector.fromAngle(noiseValue * 64 * PI);
    velocity.setMag(speed);
    position.add(PVector.div(velocity, frameRate));
    display();  
}}
  
  void display()
  {
    fill((0.4 * noiseValue * 255) % 255, 255, 255);
    noStroke();
    circle(position.x,position.y, 1);

  }
  
}
