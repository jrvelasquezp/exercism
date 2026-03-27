import gleam/list
import gleam/string
import gleam/result

pub fn recite_rec(inputs: List(String)) -> String {
  case inputs {
    []->""
    [x]->"And all for the want of a " <> "kamehameha" <> "."
    [x, ..rest]-> "For want of a "<> x <> " the " <> result.unwrap(list.first(rest),"") <> " was lost.\n" <> recite_rec(rest)
  }
}

pub fn recite(inputs: List(String)) -> String {

  recite_rec(inputs)
  |>string.replace("kamehameha", result.unwrap(list.first(inputs),""))
}
