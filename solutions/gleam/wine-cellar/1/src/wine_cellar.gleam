import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  list.filter(wines, fn(x) {x.color == color})
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  list.filter(wines, fn(x) {x.country == country})
}

pub fn filter(wines: List(Wine), color color:Color, country country: String) -> List(Wine) {
  wines_of_color(wines_from_country(wines,country),color)
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
