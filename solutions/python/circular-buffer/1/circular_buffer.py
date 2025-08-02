class BufferFullException(BufferError):

    def __init__(self, message):
        self.message = message

class BufferEmptyException(BufferError):
    
    def __init__(self, message):
        self.message = message

class CircularBuffer:
    circular_buffer=[]
    head=0 #the newest data
    tail=0 #the oldest data
    capacity=0 # the number of used slots
    bufSize=0 # size of buffer
    isBufferFull=False
    
    def __init__(self, size):
        self.circular_buffer = [None] * size
        self.bufSize=size
        self.capacity=0
        self.head = 0
        self.tail = 0
        
    def read(self):
        if self.capacity==0:
            raise BufferEmptyException("Circular buffer is empty")
        else:
            value=self.circular_buffer[self.tail]
            self.circular_buffer[self.tail]=None
            self.capacity=self.capacity-1
            print(self.head,self.tail,self.capacity,self.circular_buffer)
            self.tail=self.tail+1
            if self.tail==self.bufSize:
                self.tail=0
            return value
 
    def write(self, data):
        if self.capacity==self.bufSize:
            raise BufferFullException("Circular buffer is full")
        else:
            self.circular_buffer[self.head]=data
            self.head=self.head+1
            if self.head==self.bufSize:
                self.head=0
            self.capacity=self.capacity+1
            
    def overwrite(self, data):
        if self.capacity==self.bufSize:
            self.circular_buffer[self.tail]=data
            self.tail=self.tail+1
            if self.tail==self.bufSize:
                self.tail=0
            self.head=self.head+1
            if self.head==self.bufSize:
                self.head=0
        else:
            self.write(data)

    def clear(self):
        if self.capacity>0:
            self.circular_buffer[self.tail]=None
            self.tail=self.tail+1
            if self.tail==self.bufSize:
                self.tail=0
            self.capacity=self.capacity-1
        
