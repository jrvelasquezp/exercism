import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.fold(list, [] , fn(acc, a) { case predicate(a) {True -> [a, ..acc] False -> acc} })
  |>list.reverse
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list.fold(list, [] , fn(acc, a) { case predicate(a) {False -> [a, ..acc] True -> acc} })
  |>list.reverse
}
