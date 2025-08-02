import gleam/list

pub type Triplet {
  Triplet(a:Int, b:Int, c:Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  let list=[]
  let a=1
  let b=a+1
  let c=sum-a-b
  let list=get_triplets(sum,Triplet(a,b,c),list,False)
  list.filter(list, fn(x) { x.c*x.c-x.a*x.a-x.b*x.b==0})
}

pub fn get_triplets(limit:Int, acc: Triplet, list:List(Triplet), stop:Bool) -> List(Triplet) {
  case acc.a > limit/3 {
    False -> {
              let acc = case acc.b<acc.c {
                True -> Triplet(acc.a,acc.b+1,acc.c-1)
                False-> Triplet(acc.a+1,acc.a+2,limit-2*acc.a-3)
              }
              [acc, ..get_triplets(limit, acc, list, stop)]
    } 
    True -> list
  }
}