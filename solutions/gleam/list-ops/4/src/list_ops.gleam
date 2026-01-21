pub fn rmap (list:List(a),list2:List(b),fun:fn(a)->b)->List(b){
    let lnl=list2
    case list{
      [] -> lnl
      [a,..rest] -> {
                      let lnl=[fun(a),..lnl]
                      rmap(rest,lnl,fun)
                    }
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  concat_acc(lists,[])
}

pub fn concat_acc(lists: List(List(a)), temp:List(a)) -> List(a) {
  case lists{
    [] -> temp
    [a,..rest] -> {
                    let temp=append(temp,a)
                    concat_acc(rest,temp)
                  }      
  }
}

pub fn length(list: List(a)) -> Int {
  case list{
    [] -> 0
    [_,..rest] -> 1 + length(rest)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  reverse(rmap(list,[],function))
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
