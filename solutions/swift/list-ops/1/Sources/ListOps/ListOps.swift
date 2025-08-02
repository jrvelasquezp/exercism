func append(_ list1: [Int], _ list2: [Int]) -> [Int] {
    return list1 + list2
}

func concat(_ list: [Int]...) -> [Int] {
    var y=[Int]()
    for x in list{
        y=append(y,x)
    }
    return y
}

func filter(_ list: [Int], closure:(Int)->Bool)->[Int]{
    var newlist=[Int]()
    for i in 0..<list.count{
        if (closure(list[i])){
            newlist.append(list[i])                     
        }
    }
    return newlist
}

func map(_ list: [Int], closure:(Int)->Int)->[Int]{
    var newlist=[Int]()
    for i in 0..<list.count{
        newlist.append(closure(list[i]))
    }
    return newlist
}

func length(_ list: [Int])->Int{
    var len=0
    for i in 0..<list.count{
        len=len+1
    }
    return len
}

func reverse(_ list:[Int])->[Int]{
    var newlist=[Int]()
    for i in 0..<list.count{
        newlist.append(list[list.count-i-1])
    }
    return newlist
}

func foldLeft(_ list:[Int], accumulated:Int, combine:(Int,Int)->Int)->Int{
    var acc=accumulated
    for i in 0..<list.count{
        acc=combine(acc,list[i])
    }
    return acc                                                                            
}

func foldRight(_ list:[Int], accumulated:Int, combine:(Int,Int)->Int)->Int{
    var acc=accumulated
    for i in 0..<list.count{
        acc=combine(list[list.count-i-1],acc)
    }
    return acc                                                                     
}

func foldRight(_ list:[String], accumulated:String, combine:(String,String)->String)->String{
    var acc=accumulated
    for i in 0..<list.count{
        acc=combine(list[list.count-i-1],acc)
    }
    return acc                                                                             
}
