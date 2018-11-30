import java.util.Map;

private BlackHole blackHole;
private HashMap<Integer, Star> stars = new HashMap<Integer, Star>();
// private ArrayList<Star> stars = new ArrayList<Star>();
private Star nextStar;
private int aimX;
private int aimY;
private Integer starCounter = 0;

void setup() {
  frameRate(100);
  fullScreen();
  blackHole = new BlackHole(5, 80);
}

void draw() {
  background(20);
  blackHole.paint();
  killStars();
  applyGravity();
  moveStars();
  handleNextStar();
}

void handleNextStar() {
  if (mousePressed) {
    nextStar.hold();
    nextStar.setSpeed((aimX - mouseX) / 5, (aimY - mouseY) / 5);
    nextStar.paint();
    strokeWeight(1);
    stroke(200);
    line(mouseX, mouseY, aimX, aimY);
  }
}

void killStars() {
  ArrayList<Integer> toBeRemoved = new ArrayList<Integer>();
  for (Map.Entry<Integer, Star> star : stars.entrySet()) {
    Star temp = star.getValue();
    int killRadius = blackHole.getDiameter() / 2;
    if (Math.abs(temp.getPositionX() - blackHole.getPositionX()) < killRadius && 
      Math.abs(temp.getPositionY() - blackHole.getPositionY()) < killRadius) {
        blackHole.eat(temp);
        toBeRemoved.add(star.getKey());
    }
  }
  for (Integer id: toBeRemoved) {
    stars.remove(id);
  }
}

void applyGravity() {
  for (Map.Entry<Integer, Star> star : stars.entrySet()) {
    star.getValue().applyGravity(blackHole);
  }
}

void moveStars() {
  for (Map.Entry<Integer, Star> star : stars.entrySet()) {
    star.getValue().updatePosition();
  }
}

void generateStar() {
  Star randomStar = new Star(starCounter++);
  randomStar.setSpeed((int) random(50) - 25, (int) random(50) - 25);
  stars.put(randomStar.getId(), randomStar);
}

void mousePressed() {
  aimY = mouseY;
  aimX = mouseX;
  nextStar = new Star(starCounter++);
}

void mouseReleased() {
  stars.put(nextStar.getId(), nextStar);
}

void keyPressed() {
  if (key == '+') {
    blackHole.increaseMass();
  } else if (key == '-') {
    blackHole.decreaseMass();
  } else if (key == 'q') {
    blackHole.disappear();
  } else if (key == 'c') {
    stars.clear();
  } else if (key == 's') {
    generateStar();
  }
}
