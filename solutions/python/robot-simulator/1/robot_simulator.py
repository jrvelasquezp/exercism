# Globals for the directions
# Change the values as you see fit
EAST = 4
NORTH = 1
WEST = 2
SOUTH = 3


class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.coordinates=(x_pos,y_pos)
        self.direction=direction

    def move(self,motion):
        for char in motion:
            if char=='A':
                if self.direction==NORTH:
                    self.coordinates=(self.coordinates[0],self.coordinates[1]+1)
                elif self.direction==SOUTH:
                    self.coordinates=(self.coordinates[0],self.coordinates[1]-1)
                elif self.direction==EAST:
                    self.coordinates=(self.coordinates[0]+1,self.coordinates[1])
                elif self.direction==WEST:
                    self.coordinates=(self.coordinates[0]-1,self.coordinates[1])
            elif char=='R':
                if self.direction==NORTH:
                    self.direction=EAST
                elif self.direction==SOUTH:
                    self.direction=WEST
                elif self.direction==EAST:
                    self.direction=SOUTH
                elif self.direction==WEST:
                    self.direction=NORTH
            elif char=='L':
                if self.direction==NORTH:
                    self.direction=WEST
                elif self.direction==SOUTH:
                    self.direction=EAST
                elif self.direction==EAST:
                    self.direction=NORTH
                elif self.direction==WEST:
                    self.direction=SOUTH