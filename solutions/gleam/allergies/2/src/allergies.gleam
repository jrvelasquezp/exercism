import gleam/int
import gleam/list
import gleam/result

pub fn reduce(a: Int, b: Int, acc: List(Int)) -> List(Int) {
  case a - b {
    0 -> [b, ..acc]
    x if x < 0 -> reduce(a, b/2, acc)
    _ -> reduce(a - b, b, [b, ..acc])
  }
}

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

pub fn allergen_score(allergen: Allergen) -> Int {
  case allergen {
      Eggs -> 1
      Peanuts -> 2
      Shellfish -> 4
      Strawberries -> 8
      Tomatoes -> 16
      Chocolate -> 32
      Pollen -> 64
      Cats -> 128
  }
}

pub fn get_allergen(score: Int) -> Result(Allergen, Nil) {
  case score {
      1 -> Ok(Eggs)
      2 -> Ok(Peanuts)
      4 -> Ok(Shellfish)
      8 -> Ok(Strawberries)
      16 -> Ok(Tomatoes)
      32 -> Ok(Chocolate)
      64 -> Ok(Pollen)
      128 -> Ok(Cats)
      x if x > 255 -> get_allergen(x-255)
      _ -> Error(Nil)
  }
}

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  score
  |> list
  |> list.any(fn(x) {x==allergen})
}

pub fn list(score: Int) -> List(Allergen) {
  case score > 255 {
    True -> {
              score-256
              |> list
            }
    False -> {
                score
                |>reduce(allergen_score(Cats), [])
                |>list.map(fn(x) {get_allergen(x)})
                |>result.values
             }
  } 
}
