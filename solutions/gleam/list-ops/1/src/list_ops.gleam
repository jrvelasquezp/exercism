pub fn add_to_list(list:List(a), second: List(a))->List(a){
  let final=second
  case list{
    [] -> final
    [a,..rest] -> {
                    let final=[a,..second]
                    add_to_list(rest,final)
                   }
  }
}

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

pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  add_to_list(reverse(first),second)
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

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  let bool_filter = reverse(map_filter(list, [], function))
  reverse(acc_filter(list,bool_filter,[]))
}

fn map_filter(list: List(a), result: List(Bool), fun: fn(a)->Bool)->List(Bool){
  case list{
    [] -> result
    [a, ..rest] -> {
                      let result=[fun(a),..result]
                      map_filter(rest, result, fun)
                    }
  }
}

fn acc_filter(list1: List(a), list2: List(Bool), result: List(a)) -> List(a){
  case list1, list2 {
    [],[] -> result
    [a,..b],[True,..rest]->{
                            let result=[a,..result]
                            acc_filter(b,rest,result)
                            }
    [a,..b],[False,..rest]->{result
                            acc_filter(b,rest,result)
                            }
     _,_ -> result
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

pub fn reverse(list: List(a)) -> List(a) {
  add_to_list(list,[])
}
