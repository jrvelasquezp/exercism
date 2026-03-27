import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, fn(x) {string.lowercase(x)!=string.lowercase(word) && list.sort(string.to_graphemes(string.lowercase(x)),string.compare)==list.sort(string.to_graphemes(string.lowercase(word)),string.compare)})
}

