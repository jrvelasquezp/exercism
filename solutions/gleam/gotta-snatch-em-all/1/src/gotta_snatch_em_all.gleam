import gleam/set.{type Set}
import gleam/list
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection,card), set.insert(collection,card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  case set.contains(collection, my_card), set.contains(collection,their_card) {
    True, False -> #(True, set.insert(set.delete(collection, my_card), their_card))
    _,_ -> #(False,set.insert(set.delete(collection, my_card), their_card))
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  let acc=case collections {
    [first,..]->first
    _ -> set.new()
  }
  list.fold(collections, acc, set.intersection) |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  set.size(list.fold(collections, set.new(), set.union))
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(x) {string.starts_with(x,"Shiny ")})
}
