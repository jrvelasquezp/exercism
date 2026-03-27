import gleam/io
import gleam/int
import gleam/string
import gleam/list
import gleam/result

pub fn ipower(x: Int, y: Int)->Int {
  case y {
    0 -> 1
    1 -> x
    _ -> x * ipower(x,y-1)
  }
}

pub fn is_armstrong_number(number: Int) -> Bool {
  let list_number=int.to_string(number)
  |>string.split("")
  |>echo
  let digits=list.length(list_number)
  let sum=list.fold(list_number, 0, fn(acc,a) {acc + ipower(result.unwrap(int.parse(a),-1),digits)})
  sum==number
}
