import gleam/list
import gleam/int

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  let final_list=list.unique(counterll(limit,factors))
  list.fold( list.filter(final_list,fn(x) { x < limit }), 0, int.add)
}

pub fn counterl(limit:Int, y: Int)->List(Int){
  case limit {
    0 -> []
    _ -> list.filter([limit,..counterl(limit-1,y)],fn(x){x % y == 0})
  }
}

pub fn counterll(limit: Int, mult: List(Int))->List(Int){
  case mult {
    []->[]
    [0]->[]
    [x]->counterl(limit,x)
    [x,..y]->list.append(counterl(limit,x),counterll(limit,y))
  }
}
