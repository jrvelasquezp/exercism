pub type Error {
  InvalidSquare
}

pub fn double(n: Int)->Int{
  case n {
    1->1
    n->2*double(n-1)
  }
}

pub fn sum(n: Int)->Int{
  case n{
    1->1
    n->double(n)+sum(n-1)
  }  
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square > 0 && square < 65 {
    True -> Ok(double(square))
    False -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  let squares=64
  sum(squares)
}
