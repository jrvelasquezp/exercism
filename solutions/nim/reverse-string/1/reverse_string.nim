proc reverse*(s: string): string =
  var rs=""
  for i in 1 .. len(s):
    rs.add(s[len(s)-i])
  return rs
