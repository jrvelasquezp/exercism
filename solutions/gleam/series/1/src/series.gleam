import gleam/string

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
