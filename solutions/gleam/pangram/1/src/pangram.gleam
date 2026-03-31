import gleam/list
import gleam/string
import gleam/int
import gleam/result
import gleam/set

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet="abcdefghijklmnopqrstuvwxyz"
  |>string.to_graphemes
  |>set.from_list
  let sentence_set=string.replace(sentence," ","")
  |>string.lowercase
  |>string.to_graphemes
  |>set.from_list
  set.intersection(alphabet,sentence_set)==alphabet
}
