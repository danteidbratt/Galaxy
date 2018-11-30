class BlackHole extends CelestialBody {

  BlackHole(int mass, int diameter) {
    super(mass, diameter, width / 2, height / 2, color(200, 10, 10));
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
    if (mass > 1) {
      this.mass--; 
      this.diameter--;
    }
  }

  void disappear() {
    this.mass = 0;
    this.diameter = 0;
  }
}
