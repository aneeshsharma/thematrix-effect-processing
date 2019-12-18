class Entity {
  PVector pos, speed;
  PVector textPos;
  char ch;
  int trailLength = 5;
  
  Entity(PVector pos, PVector speed, char[] chars_possible) {
    this.pos = pos;
    this.speed = speed;
    textPos = new PVector(0, 0);
    int i = (int) random(0f, (float)chars_possible.length);
    ch = chars_possible[i];
  }
  
  void draw() {
    textAlign(CENTER);
    noStroke();
    textSize(18);
    for (int i = 0; i < trailLength; i++) {
      fill((i == 0) ? 255 : 20, 255, (i == 0) ? 255 : 0, 255 - map(i, 0, trailLength - 1, 1, 255));
      text(ch, textPos.x, textPos.y - (i * speed.y/20));
    }
  }
  
  void step(float time) {
    pos.add(PVector.mult(speed, time));
    int stepSize = 18;
    textPos.x = stepSize * (floor(pos.x / stepSize));
    textPos.y = pos.y;
  }
}
