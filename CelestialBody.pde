class CelestialBody {
  
  protected int mass;
  protected int diameter;
  protected float positionX;
  protected float positionY;
  protected color colour;
  
  protected CelestialBody(int mass, int diameter, float positionX, float positionY, color colour) {
    this.mass = mass;
    this.diameter = diameter;
    this.positionX = positionX;
    this.positionY = positionY;
    this.colour = colour;
  }
  
  int getMass() {
    return mass;
  }
  
  int getDiameter() {
    return diameter; 
  }
  
  float getPositionX() {
    return positionX;
  }
  
  float getPositionY() {
    return positionY;
  }
  
  void paint() {
    stroke(colour);
    strokeWeight(diameter);
    point(positionX, positionY);
  }
  
}
