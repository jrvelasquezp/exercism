import gleam/string
import gleam/list

pub fn is_isogram(phrase phrase: String) -> Bool {
  let phrase = string.replace(phrase," ","")
  let phrase = string.replace(phrase,"-","")
  let text_list=string.to_graphemes(string.lowercase(phrase))
  text_list == list.unique(text_list)
}
