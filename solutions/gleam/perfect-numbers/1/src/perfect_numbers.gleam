import gleam/int
import gleam/float

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  case number {
    x if x < 1 ->Error(NonPositiveInt)
    _ -> case aliquot(number)==number, aliquot(number) < number {
          True, False -> Ok(Perfect)
          False, False  -> Ok(Abundant)
          _,_-> Ok(Deficient)
        }
  }
}

pub fn int_sqrt(n: Int)->Int{
  case int.square_root(n) {
    Ok(v) -> float.round(v)
    Error(_) -> -1 
  }
}

pub fn aliquot_n(n:Int, i: Int) -> Int {
  case i {
    1 if n==1 -> 0
    1 -> 1
    _ -> case n%i==0, n/i==i {
      True, True->i
      True, False -> i+{n/i}
      False, _ -> 0
      }
  }
}

pub fn aliquot_acc(n:Int, acc: Int) -> Int{
  case acc {
    1 -> aliquot_n(n,1)
    _ -> aliquot_n(n,acc)+aliquot_acc(n,acc-1)
  }
}

pub fn aliquot(n: Int) -> Int {
  int_sqrt(n)
  |> aliquot_acc(n,_)
}

