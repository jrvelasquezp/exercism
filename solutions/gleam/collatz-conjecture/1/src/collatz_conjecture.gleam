pub type Error {
  NonPositiveNumber
}

pub fn collatz(n: Int, acc: Int) {
  case n == 1 {
    True -> acc
    False -> {
            let acc=acc+1
            case n % 2 == 0 {
              True -> collatz(n/2, acc)
              False -> collatz(3*n + 1, acc)
            }
  }
}
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    False -> Error(NonPositiveNumber)
    True -> Ok(collatz(number,0))
  }
}
