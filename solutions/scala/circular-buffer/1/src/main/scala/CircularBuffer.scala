class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  var buffer = new Array[Int](capacity)
  var head : Int = 0
  var tail : Int = 0
  var usedSlots : Int = 0
  def write(value: Int) = {
    if(usedSlots==capacity){
      throw new FullBufferException()
    }
    else{
      buffer(head)=value
      head=head+1
      if(head==capacity){
        head=0
      }
      usedSlots=usedSlots+1  
    }
  }

  def read(): Int = {
    if(usedSlots==0){
      throw new EmptyBufferException()
    }
    else{
      var value : Int = 0
      value=buffer(tail)
      buffer(tail)=0
      tail=tail+1
      if(tail==capacity){
        tail=0
      }
      usedSlots=usedSlots-1
      return value
    }
  }

  def overwrite(value: Int) = {
    if(usedSlots==capacity){
      buffer(tail)=value
      tail=tail+1
      if(tail==capacity){
        tail=0
      }
      head=head+1
      if(head==capacity){
        head=0
      }
    }
    else{
      write(value)
    }
  }

  def clear() = {
    if(usedSlots > 0){
      buffer(tail)=0
      tail=tail+1
      if(tail==capacity){
        tail=0
      }
      usedSlots=usedSlots-1
    }
  }
}