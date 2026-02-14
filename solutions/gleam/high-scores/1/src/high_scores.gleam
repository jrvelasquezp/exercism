import gleam/list
import gleam/int

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  case high_scores {
    [] -> Error(Nil)
    _ -> {
          let best=high_scores
          |>list.last
          }
  }
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  case high_scores {
    [] -> Error(Nil)
    _ -> {
          let best=high_scores
          |>personal_top_three
          |>list.first
          }
  }
}

pub fn personal_top_three(high_scores: List(Int)) -> List(Int) {
  high_scores
  |>list.sort(int.compare)
  |>list.reverse
  |>list.take(3)
}
