pub fn length(list: List(a)) -> Int {
  case list{
    [] -> 0
    [_,..rest] -> 1 + length(rest)
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [a,..rest] -> { 
                  let initial=function(initial,a)
                  foldl(rest,initial,function)
                  }
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  let list=reverse(list)
  case list {
    [] -> initial
    [a,..rest] -> { 
                  let initial=function(initial,a)
                  foldl(rest,initial,function)
                  }
  }
}

//refactored
pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldl(list, [] , fn(acc, a) { case function(a) {True -> [a, ..acc] False -> acc} })
  |>reverse
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [] , fn(acc, a) {[a, ..acc]})
}

pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldl(reverse(first), second, fn(first, second) {[second, ..first]})
}

//refactor, foldr
pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  list
  |>foldr([], fn(acc, a) {[function(a), ..acc]})
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldr(lists, [], fn(acc,a) {append(a,acc)})
}
