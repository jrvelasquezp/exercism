import gleam/dict.{type Dict}
import gleam/list
import gleam/string
import gleam/result


pub fn clean_string(st:String)->String {
  st
  |>clean_double_apostrophe
  |>string.replace(".","")
  |>string.replace("\n"," ")
  |>string.replace("!","")
  |>string.replace(":","")
  |>string.replace("&","")
  |>string.replace("%","")
  |>string.replace("$","")
  |>string.replace("@","")
  |>string.replace("^","")
  |>string.replace(","," ")
  |>string.replace("   "," ")
  |>string.replace("  "," ")
  |>string.trim
}

pub fn count_words(input: String) -> Dict(String, Int) {
  let words=clean_string(input)
  |>string.split(" ")
  |>list.map(fn(x) {clean_double_apostrophe(x)})
  |>echo
  let word_dict=dict.new()
  list.fold(words,word_dict,fn (acc,a) {case dict.has_key(acc,string.lowercase(a)) {
                                      True-> case dict.get(acc,string.lowercase(a)){
                                              Ok(v)-> dict.insert(acc,string.lowercase(a),v+1)
                                              Error(e)->dict.insert(acc,string.lowercase(a),-1)
                                            }
                                      False->dict.insert(acc,string.lowercase(a),1)
                                    }})
}

pub fn clean_double_apostrophe(input: String)->String{
  case string.starts_with(input,"'") && string.ends_with(input,"'"){
    True -> string.drop_start(string.drop_end(input,1),1)
    False -> input
  }
}
