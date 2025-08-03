pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && a >. 0.0 && b >. 0.0 && c >. 0.0
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  {a==b || b==c || a==c} && a +. b >=. c && a +. c >=. b && b +. c >=. a  
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  !equilateral(a,b,c) && !isosceles(a,b,c) && a +. b >=. c && a +. c >=. b && b +. c >=. a
}
