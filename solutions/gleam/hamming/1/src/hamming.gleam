import gleam/string
import gleam/list


pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1)==string.length(strand2) {
    False -> Error(Nil)
    True-> {
      let ls1=string.to_graphemes(strand1)
      let ls2=string.to_graphemes(strand2)
      let diff=list.map2(ls1,ls2, fn(x,y) {x==y})
      |>list.filter(fn(x) {x==False})
      |>list.length
      Ok(diff)
    }
  }
}
