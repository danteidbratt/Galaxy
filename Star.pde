class Star extends CelestialBody{
  
  public static final float SPEED_MULTIPLIER = 0.3;
  private Integer id;
  private float speedX;
  private float speedY;  

  Star(Integer id) {
    super(1, 20, mouseX, mouseY, color(255));
    this.id = id;
    setSpeed(0, 0);
  }
  
  Integer getId() {
    return id;
  }
  
  void applyGravity(CelestialBody otherBody) {
    float distanceX = this.positionX - otherBody.getPositionX();
    float distanceY = this.positionY - otherBody.getPositionY();
    double distance = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2));
    double degreeOfInflueceX = distanceX / distance;
    double degreeOfInflueceY = distanceY / distance;
    this.speedX -= (degreeOfInflueceX * otherBody.getMass()) / (Math.pow(distance, 2) * 0.0001);
    this.speedY -= (degreeOfInflueceY * otherBody.getMass()) / (Math.pow(distance, 2) * 0.0001);
  }
  
  void hold() {
    this.positionX = mouseX;
    this.positionY = mouseY;
  }
  
  void setSpeed(float speedX, float speedY) {
    this.speedX = speedX;
    this.speedY = speedY;
  }
  
  void updatePosition() {
    this.positionX += speedX * SPEED_MULTIPLIER;
    this.positionY += speedY * SPEED_MULTIPLIER;
    this.paint();
  }
}
