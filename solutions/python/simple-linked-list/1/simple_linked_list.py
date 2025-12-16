class EmptyListException(Exception):
    def __init__(self, message):
        self.message = message

class Node:
    def __init__(self, val):
        self.val=val
        self.next_val=None

    def value(self):
        return self.val

    def next(self):
        return self.next_val


class LinkedList:
    def __init__(self, values=None):
        self.length=0
        self.top=Node(0)
        #self.next_node=self.head().next()
        if values is None:
            self.length=0
        else:
            for v in values:
                self.push(v)
                
    def __iter__(self):
        if len(self)==0:
            yield from ()
        else:
            node=self.head()
            while node is not None:
                yield node.value()
                node=node.next()

    def __len__(self):
        return self.length

    def head(self):
        if len(self)==0:
            raise EmptyListException("The list is empty.")
        else:
            return self.top
            
    def push(self, value):
        if len(self)==0:
            self.top=Node(value)
            self.length=1
        else:
            temp_node=self.top
            self.top=Node(value)
            self.length=self.length+1
            self.top.next_val=temp_node

    def pop(self):
        val=0
        if len(self)==0:
            raise EmptyListException("The list is empty.")
        elif len(self)==1:
            val=self.top.val
            self.top=None
            self.length=0
            print(self.length)
            return val
        else:
            val=self.top.val
            self.top=self.head().next()
            self.length=self.length-1
            print(self.length)
            return val

    def reversed(self):
        return LinkedList(list(self))
