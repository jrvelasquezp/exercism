class Hamming {
  static compute(first, second) {
    var distance = 0
    if (first.count != second.count) {
      Fiber.abort("strands must be of equal length")
    }
    if (first.count > 0) {
      for (i in 0..first.count-1) {
        if (first.codePoints[i]!=second.codePoints[i]) {
          distance=distance+1
        }      
      }
    } 
    return distance
  }
}
