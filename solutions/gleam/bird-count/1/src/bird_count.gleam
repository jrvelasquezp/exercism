pub fn today(days: List(Int)) -> Int {
  case days{
    [] -> 0
    [a, ..rest] -> a
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days{
    [] -> [1]
    [a, ..rest] -> [a+1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days{
    [] -> False
    [a, ..rest] if a == 0 -> True
    [_, ..rest] -> False || has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days{
    [] -> 0
    [a, ..rest] -> a + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days{
    [] -> 0
    [a, ..rest] if a >= 5 -> 1 + busy_days(rest)
    [_, ..rest] -> busy_days(rest)
  }
}
