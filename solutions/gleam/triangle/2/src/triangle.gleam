fn is_valid(a: Float, b: Float, c: Float) -> Bool {
  a >. 0.0 &&
  b >. 0.0 &&
  c >. 0.0 &&
  a +. b >=. c && 
  b +. c >=. a && 
  a +. c >=. b
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && is_valid(a,b,c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  {a==b || b==c || a==c} && is_valid(a,b,c) 
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  !equilateral(a,b,c) && !isosceles(a,b,c) && is_valid(a,b,c)
}
