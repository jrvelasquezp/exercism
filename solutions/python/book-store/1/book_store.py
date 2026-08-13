base_states = [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1]]

# counts number of books and return sorted in reverse order
def counter(basket):
    counter=[0,0,0,0,0]
    books=[1,2,3,4,5]
    for x in basket:
        for y in books:
            if x == y:
                counter[y-1]=counter[y-1]+1
    counter=sorted(counter,reverse=True)
    counter=[x for x in counter if x>0]
    return counter

# returns a list of base states from a given state
def reduce(state):
    state_list=[]
    while True:
        if state == []:
            return state_list
        elif state in base_states:
            state_list.append(state)
            state = []
        else:
            for base in base_states:
                if len(base)==len(state):
                    for i in range(0,len(base)):
                        state[i]=state[i]-base[i]
                    state_list.append(base)
            state=[x for x in state if x>0]
            #print(estado, lista_estados)

# counts frequency of states in reverse order
def count_states(state_list):
    counter=[0,0,0,0,0]
    for i in range(0,len(state_list)):
        for j in range(0, len(base_states)):
            if state_list[i]==base_states[j]:
                counter[j]=counter[j]+1
    return counter

# replaces all 5-3 by 4-4 in a given state list
def optimize_states(state_list):
    counter=count_states(state_list)
    while counter[4]>0 and counter[2]>0:
        state_list.remove([1,1,1])
        state_list.remove([1,1,1,1,1])
        state_list.append([1,1,1,1])
        state_list.append([1,1,1,1])
        counter=count_states(state_list)
    return state_list

# get price discount given a base case
def get_price(state, price):
    if len(state) == 0:
        return 0
    elif len(state) == 1:
        return price
    elif len(state) == 2:
        return len(state)*0.95*price
    elif len(state) == 3:
        return len(state)*0.90*price
    elif len(state) == 4:
        return len(state)*0.80*price
    elif len(state) == 5:
        return len(state)*0.75*price

#return total price of a list
def total(basket):
    unit_price=800
    state=counter(basket)
    state_list=reduce(state)
    state_list=optimize_states(state_list)
    total_price=0
    for state in state_list:
        total_price=total_price+get_price(state,unit_price)
    return total_price
