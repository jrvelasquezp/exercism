import gleam/string
import gleam/list
import gleam/int
import gleam/result

pub fn dup_reduce(n: Int)->Int {
  case 2*n > 9 {
    True -> 2*n-9
    False -> 2*n
  }
}

pub fn parse_digit(str: String) -> Result(Int, Nil){
  case int.parse(str) {
    Ok(n) -> Ok(n)
    Error(_) -> Error(Nil)
  }
}

pub fn check_all_digits(li:List(String))->Bool{
  list.map(li,fn(x) {parse_digit(x)})
  |>list.fold(True, fn(acc,a) {case a {Ok(n)->True && acc Error(_)->False && acc}})
}

pub fn valid(value: String) -> Bool {
  let sum=value
  //remove spaces
  |>string.replace(" ","")
  let validate=case sum {
    "0" -> False //string is a single zero
    _ -> case check_all_digits(string.split(sum,"")) {
           False -> False
           True -> { 
                   let check=sum
                   |>string.split("")
                   |>list.reverse
                   |>list.index_map(fn (x,i) {case i%2==0 {True -> x False -> int.to_string(dup_reduce(result.unwrap(int.parse(x), 0)))}})
                   |>list.fold(0, fn(acc, x) {acc+result.unwrap(int.parse(x), 0)})
                   check % 10 == 0
                   }
         }
  }
  validate
}
