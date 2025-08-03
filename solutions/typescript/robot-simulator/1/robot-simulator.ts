export class InvalidInputError extends Error {
  constructor(message: string) {
    super()
    this.message = message || 'Invalid Input'
  }
}

type Direction = 'north' | 'east' | 'south' | 'west'
type Coordinates = [number, number]

export class Robot {
  private direction: Direction
  private position: Coordinates
  
  constructor (direction:Direction='north', x: number=0, y: number=0){
    this.direction=direction
    this.position=[x,y]
  }
  get bearing(): Direction {
    return this.direction
  }

  get coordinates(): Coordinates {
    return this.position
  }

  place({direction,x,y}: { x: number; y: number; direction: Direction }) {
    if (['north', 'east', 'south', 'west'].indexOf(direction) < 0) {
      throw new InvalidInputError("Not allowed direction");
    }
    this.direction=direction
    this.position=[x,y]
  }

  evaluate(instructions: string) {
    let i: number = 0
    while (i < instructions.length) {
      if (instructions.charAt(i) == 'A') {
        switch (this.direction) {
          case 'north': {
            this.position[1]=this.position[1]+1
            break
          }
          case 'east': {
            this.position[0]=this.position[0]+1
            break
          }
          case 'south': {
            this.position[1]=this.position[1]-1
            break
          }
          case 'west': {
            this.position[0]=this.position[0]-1
            break
          }
        }
      }
      else if (instructions.charAt(i) == 'R') {
        switch (this.direction) {
          case 'north': {
            this.direction='east'
            break
          }
          case 'east': {
            this.direction='south'
            break
          }
          case 'south': {
            this.direction='west'
            break
          }
          case 'west': {
            this.direction='north'
            break
          }
        }
      }
      else if (instructions.charAt(i) == 'L') {
        switch (this.direction) {
          case 'north': {
            this.direction='west'
            break
          }
          case 'east': {
            this.direction='north'
            break
          }
          case 'south': {
            this.direction='east'
            break
          }
          case 'west': {
            this.direction='south'
            break
          }
        }
      }
      i++;
    }

  }
}
