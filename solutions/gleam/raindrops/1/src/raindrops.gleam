import gleam/int

pub fn convert(number: Int) -> String {
  let is_pling = case number % 3{
    0 -> "Pling"
    _ -> ""
  }
  let is_plang = case number % 5{
    0 -> "Plang"
    _ -> ""
  }
  let is_plong = case number % 7{
    0 -> "Plong"
    _ -> ""
  }
  case is_pling <> is_plang <> is_plong{
    "" -> int.to_string(number)
    _ -> is_pling <> is_plang <> is_plong
  }  
}
