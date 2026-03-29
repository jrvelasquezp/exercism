import gleam/list
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn code(color: String) -> Int {
  case color {
    "black" -> 0
    "brown"-> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> -1
  }
}

pub fn multiplier(color: String) -> Int {
  case color {
    "black" -> 1
    "brown"-> 10
    "red" -> 100
    "orange" -> 1000
    "yellow" -> 10000
    "green" -> 100000
    "blue" -> 1000000
    "violet" -> 10000000
    "grey" -> 100000000
    "white" -> 1000000000
    _ -> -1
  }
}

pub fn value(colors: List(String)) -> Result(Int, Nil) {
  case colors {
    [_,_]-> {
              list.map(colors, fn(x) {code(x)})
              |>list.fold(0, fn(acc,a) {10*acc+a})
              |>Ok
            }
    _ -> Error(Nil)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors{
    [x, y, z, ..] ->{
                    let val=multiplier(z)*{10*code(x)+code(y)}
                    let u=case val{
                      x if x>=1000000000 -> "gigaohms"
                      x if x>=1000000 -> "megaohms"
                      x if x>=1000 -> "kiloohms"
                      _ -> "ohms"
                    }
                    let val=case val {
                      x if x>=1000000000 -> val/1000000000
                      x if x>=1000000 -> val/1000000
                      x if x>=1000 -> val/1000
                      _ -> val
                    }
                    Ok(Resistance(unit: u, value: val))
                    }
    _ -> Error(Nil)
  }
}
