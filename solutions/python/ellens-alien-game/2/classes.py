"""Solution to Ellen's Alien Game exercise."""


class Alien:
    x_coordinate=0
    y_coordinate=0
    health=0
    total_aliens_created=0

    def __init__(self,x,y):
        self.x_coordinate=x
        self.y_coordinate=y
        self.health=3
        Alien.total_aliens_created=Alien.total_aliens_created+1

    def hit(self):
        self.health=self.health-1

    def is_alive(self):
        return self.health>0

    def teleport(self,x,y):
        self.x_coordinate=x
        self.y_coordinate=y

    def collision_detection(self,alien):
        pass
    
def new_aliens_collection(coordinates):
    alien_list=[]
    for coord in coordinates:
        alien_list.append(Alien(coord[0],coord[1]))
    return alien_list
