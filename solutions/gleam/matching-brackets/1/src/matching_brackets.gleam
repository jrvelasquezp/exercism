import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  value
  |>string.to_graphemes
  |>list.filter(fn(x) {x=="(" || x==")" || x=="{" || x=="}" || x=="[" || x=="]"})
  |>string.join("")
  |>delete_substring("[]","")
  |>delete_substring("{}","")
  |>delete_substring("()","")
  |>delete_substring("[]","")
  |>delete_substring("{}","")
  |>delete_substring("()","")
  |>string.is_empty
}

pub fn delete_substring(txt:String, pattern:String, acc:String){
  case string.length(txt), string.contains(txt,pattern){
    0,_->txt
    _,False-> txt
    _,_-> delete_substring(string.replace(txt,pattern,"") <> acc,pattern,acc)
  }
}
