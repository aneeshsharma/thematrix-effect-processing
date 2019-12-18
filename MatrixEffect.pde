ArrayList<Entity> entities;

char[] chars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

float t;

void setup() {
  fullScreen(P2D);
  frameRate(120);
  entities = new ArrayList<Entity>();
  t = 0;
}

void draw() {
  float delta = millis() / 1000f - t;
  t = millis() / 1000f;
  background(0);
  for(Entity ent : entities){
    ent.draw();
    ent.step(delta);
  }
  for (int i=0;i<4;i++)
    entities.add(new Entity(new PVector(random(10, width), -10), new PVector(0, random(100, 400)), chars));

  ArrayList<Entity> garbage = new ArrayList<Entity>();
  for (Entity ent : entities) {
    if (ent.pos.y > height + 100)
      garbage.add(ent);
  }

  for (Entity ent : garbage) {
    entities.remove(ent);
  }
}
