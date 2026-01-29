import gleam/list
import gleam/string
import gleam/dict.{type Dict}

pub fn tuple_to_list(tuple:#(Int, List(String)))->List(#(String, Int)) {
  list.map(tuple.1, fn(x) {#(string.lowercase(x),tuple.0)})
}

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  echo dict.to_list(legacy)
  |>list.map(fn(x) {tuple_to_list(x)})
  |>list.flatten()
  |>dict.from_list()
}