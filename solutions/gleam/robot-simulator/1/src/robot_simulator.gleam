import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  let new_robot=Robot(direction,position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case instructions {
      "" -> Robot(direction,position)
    _ -> {
          let command=string.slice(instructions,0,1)
          let robotemp=single_move(direction,position,command)
          move(robotemp.direction,robotemp.position,string.drop_left(instructions,1))
    }
  }
}

pub fn single_move(
  direction: Direction,
  position: Position,
  command: String,
) -> Robot {
  let direction=case command, direction {
    "R",North -> East
    "R",South -> West
    "R",East -> South
    "R",West -> North
    "L",North -> West
    "L",South -> East
    "L",East -> North
    "L",West -> South
    _,_ -> direction
  }
  let x= position.x
  let y= position.y
  let x = case command, direction {
    "A", East -> x+1
    "A", West -> x-1
    _,_ -> x
  }
  let y = case command, direction {
    "A", North -> y+1
    "A", South -> y-1
    _,_ -> y
  }
  let position=Position(x,y)
  let new_robot=Robot(direction,position)
}
