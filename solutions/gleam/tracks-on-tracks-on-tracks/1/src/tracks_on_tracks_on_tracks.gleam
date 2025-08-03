import gleam/list

pub fn new_list() -> List(String) {
  let newlist = []
}

pub fn existing_list() -> List(String) {
  let list2 =["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  let newlist = [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  list.length(languages)
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  let size = list.length(languages)
  case languages {
    ["Gleam", ..rest] -> True
    [_,"Gleam", ..rest] if size < 4 -> True
    _ -> False
  }
}
