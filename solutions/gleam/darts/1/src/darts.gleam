pub fn score(x: Float, y: Float) -> Int {
  let radius = x *. x +. y *. y
  let score = case radius {
    r if r <=. 1.0 -> 10
    r if r <=. 25.0 -> 5
    r if r <=. 100.0 -> 1
    _ -> 0
  }
}
