import gleam/io
import gleam/int
import gleam/string
import gleam/list
import gleam/result

pub fn largest_product(digits: String, span: Int) -> Result(Int, Nil) {
  let len=string.length(digits)
  case digits, int.parse(digits), span {
    _,_,0 -> Ok(1)
    _,Error(_),_->Error(Nil)
    _,_,x if x < 0 ->Error(Nil)
    _,_,x if x > len ->Error(Nil)
    _,_,x if x == len ->{
                          let product=digits
                          |>string.to_graphemes
                          |>list.map(int.parse)
                          |>result.values
                          |>int.product
                          |>echo
                          Ok(product)
                        }
    _,_,_-> {
              [slices(digits,span)]
              |>result.values
              |>list.flatten
              |>list.map(string.to_graphemes)
              |>list.map(fn(x) {list.map(x, int.parse)})
              |>list.map(fn(x) {result.values(x)})
              |>list.map(int.product)
              |>list.max(int.compare)
            }
  }
}

pub fn slices_acc(str: String, size: Int, acc: List(String)) -> List(String) {
  let acc=case string.length(str)==size {
    True -> [string.slice(str, 0, size)]
    False -> {
               let substring=string.slice(str, 0, size)
               echo [substring, ..slices_acc (string.drop_start(str, 1), size, acc)]
             }

  }
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let len=string.length(input)
  case input {
    "" -> Error(EmptySeries)
    _ -> case size {
        0 -> Error(SliceLengthZero)
        x if x < 0 -> Error(SliceLengthNegative)
        x if x > len  -> Error(SliceLengthTooLarge)
        x if x == len -> Ok([input])
        _ -> Ok(slices_acc(input, size, []))
    }
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
