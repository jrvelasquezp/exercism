import gleam/list
import gleam/string
import gleam/int
import gleam/result

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let dividers=[8,4,2,1]
  let operations=[Jump, CloseYourEyes, DoubleBlink, Wink]
  let dividers=list.map(dividers, fn(x) {int.bitwise_and(encoded_message, x)==x})
  let summary=list.map2(dividers, operations, fn(x,y) {case x {True->Ok(y) False->Error(Nil)}})
  |>result.values  
  let operations=case encoded_message/16 == 1 {
      False ->  list.reverse(summary)
      True -> summary
    }
}
