class StackUnderflowError(Exception):
    def __init__(self, message):
        self.message = message

operators = ['+','-','*','/','dup','drop','swap','over']
unary_operators=['dup','drop']
binary_operators=['+','-','*','/', 'swap', 'over']

def is_all_numeric(stack):
  return all(x.lstrip('-').isnumeric() for x in stack)

def is_valid_user_defined_word(stack):
  #check if there are beginning and end symbols
  valid=False
  if stack[0]==":" and stack[-1]==";":
    #check if the operation does not redefine a number
    if stack[1].lstrip('-').isnumeric():
      raise ValueError("illegal operation")
    else:
      valid=True
  return valid


def evaluate(input_data):
    user_defined_words=dict()
    stack=input_data
    if len(stack) > 1:
      text=stack[-1]
      for line in stack[:-1]:
        if is_valid_user_defined_word(line):
          #check if the user defined word is on the dictionary
          key=line.split(" ")[1].lower()
          #check if values are already on dict
          v_list=line.split(" ")[2:-1]
          for v in v_list:
            if v.lower() in user_defined_words.keys():
              v_list[v_list.index(v)]=user_defined_words[v].lower()
          val=" ".join(v_list).lower()
          if key in user_defined_words.keys():
            user_defined_words[key]=val
          else:
            user_defined_words[key]=val

    new_stack=stack[-1].split(" ")
    for v in new_stack:
      new_stack[new_stack.index(v)]=v.lower()
    for v in new_stack:
      if v in user_defined_words.keys():
        new_stack[new_stack.index(v)]=user_defined_words[v]
    new_stack=(' '.join(new_stack)).split(' ')
    if is_valid_user_defined_word(new_stack):
      new_stack=[]
    if len(new_stack)==1 and not is_all_numeric(new_stack) and not any (x in operators for x in new_stack) :
        raise ValueError("undefined operation")
    elif len(new_stack)==1 and not is_all_numeric(new_stack):
        raise StackUnderflowError("Insufficient number of items in stack")
    elif len(new_stack)==2 and not is_all_numeric(new_stack) and not any(x in unary_operators for x in new_stack):
        raise StackUnderflowError("Insufficient number of items in stack")
    elif is_all_numeric(new_stack):
      print([int(x) for x in new_stack])
    else:
      for element in new_stack:
        if element.lower() in binary_operators:
          left_list=new_stack[:new_stack.index(element)-2]
          center_list=new_stack[new_stack.index(element)-2: new_stack.index(element)]
          right_list=new_stack[new_stack.index(element)+1:]
          #reduction block
          if element == '+':
            center_list=[str(int(center_list[0])+int(center_list[1]))]
          elif element == "-":
            center_list=[str(int(center_list[0])-int(center_list[1]))]
          elif element == "*":
            center_list=[str(int(center_list[0])*int(center_list[1]))]
          elif element ==  "/":
            if center_list[1]=='0':
              raise ZeroDivisionError("divide by zero")
            else:
              center_list=[str(int(center_list[0])//int(center_list[1]))]
          elif element.lower() == "swap":
            center_list=[center_list[1],center_list[0]]
          elif element.lower() == "over":
            center_list=center_list+[center_list[0]]
          new_stack=left_list+center_list+right_list
        elif element.lower() in unary_operators:
          left_list=new_stack[:new_stack.index(element)-1]
          center_list=new_stack[new_stack.index(element)-1: new_stack.index(element)]
          right_list=new_stack[new_stack.index(element)+1:]
          if element.lower() == 'dup':
            center_list=[center_list[0], center_list[0]]
          elif element.lower() == 'drop':
            center_list=[]
          new_stack=left_list+center_list+right_list
    
    return [int(x) for x in new_stack]

