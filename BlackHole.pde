class BlackHole extends CelestialBody {
  
  private final int initialMass;

  BlackHole(int mass, int diameter) {
    super(mass, diameter, width / 2, height / 2, color(200, 10, 10));
    this.initialMass = mass;
  }

  void eat(Star star) {
    this.mass += star.getMass();
    this.diameter += star.getMass();
  }

  void increaseMass() {
    this.mass++;
    this.diameter++;
  }

  void decreaseMass() {
    if (this.mass > this.initialMass) {
      this.mass--; 
      this.diameter--;
    }
  }

  void disappear() {
    this.mass = 0;
    this.diameter = 0;
  }
}
