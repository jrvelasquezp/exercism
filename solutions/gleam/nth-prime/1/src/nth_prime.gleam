import gleam/list
import gleam/int
import gleam/float

pub fn round_sqrt(n: Int) -> Int {
 case int.square_root(n) {
   Ok(value)-> float.round(value)
   Error(_)-> -1
 }
}

pub fn is_prime_2(n: Int, acc: Int)->Bool {
  let limit = round_sqrt(n) 
  case n==acc, n % acc == 0{
    True, _ -> True
    _, True -> False
    _, _x if acc > limit-> True
    _, _-> True && is_prime_2(n, acc+1)
  }
}

pub fn is_prime(n: Int)-> Bool {
  is_prime_2(n, 2)
}

pub fn nth_prime(n: Int) {
  let ll=list.range(2, 110000)
  |>list.filter(fn(x) {is_prime(x)})
  let drop_elements=list.length(ll)
  let drop_elements=drop_elements-n
  //echo drop_elements
  let ll=ll
  |>list.reverse
  |>list.drop(drop_elements)
  |>list.reverse
  case list.last(ll) {
    Ok(value)-> value
    Error(_)->-1
  }
}

pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    0 -> Error(Nil)
    _ -> Ok(nth_prime(number))
  }
}
