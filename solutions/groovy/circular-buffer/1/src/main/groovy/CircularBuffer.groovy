class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    int head, tail, capacity, usedSlots
    int[] buffer
    
    CircularBuffer(int capacity) {
        this.head=0
        this.tail=0
        this.usedSlots=0
        this.capacity=capacity
        this.buffer=new int[capacity]
    }

    def clear() {
        if(this.usedSlots>0){
            this.buffer[tail]=0
            this.usedSlots=this.usedSlots-1
            this.tail=this.tail+1
            if(this.tail==this.capacity){
                this.tail=0
            }        
        }
    }

    def read() {
        if(this.usedSlots==0){
            throw new EmptyBufferException()
        }
        else{
            def readVal=0
            readVal=this.buffer[tail]
            this.buffer[tail]=0
            this.usedSlots=this.usedSlots-1
            this.tail=this.tail+1
            if(this.tail==this.capacity){
                this.tail=0
            }    
            return readVal
        }
    }

    def write(int item) {
        if(this.usedSlots==this.capacity){
            throw new FullBufferException()
        }
        this.buffer[head]=item
        this.usedSlots=this.usedSlots+1
        this.head=this.head+1
        if(this.head==this.capacity){
            this.head=0
        }
    }

    def overwrite(int item) {
        if(this.usedSlots==this.capacity){
            this.buffer[tail]=item
            this.tail=this.tail+1
            if(this.tail==this.capacity){
                this.tail=0
            }
        }
        else{
            this.write(item)
        }
    }
}
