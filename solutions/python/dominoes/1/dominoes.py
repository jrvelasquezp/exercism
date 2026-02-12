from itertools import permutations
#check if can have the same first and last
def same_first_last(perms):
    return perms[0][0]==perms[-1][0] or perms[0][0]==perms[-1][1] or perms[0][1]==perms[-1][0] or perms[0][0]==perms[-1][1]

def is_valid_chain(tup):
  return tup[0]

def flip(tup):
  return tuple(reversed(tup))

def flip_sort(ll):
  chain=True
  #step 1. put end and beginning tuple with the same number
  if ll[0][0]==ll[-1][0]:
    ll[-1]=flip(ll[-1])
  elif ll[0][1]==ll[-1][1]:
    ll[0]=flip(ll[0])
  else:
    ll[0]=flip(ll[0])
    ll[-1]=flip(ll[-1])
  #step 2. check if the end of x matches with end of x+1
  for i in range(0,len(ll)-1):
    if ll[i][1]==ll[i+1][0]:
      continue
    elif ll[i][1]==ll[i+1][1] and i+1<len(ll)-1:
      ll[i+1]=flip(ll[i+1])
    else:
      chain=False

  return (chain, ll)

def can_chain(dominoes):
    if dominoes==[]:
        return []
    elif len(dominoes) == 1 and dominoes[0][0] == dominoes[0][1]:
        return dominoes
    elif len(dominoes) == 1 and dominoes[0][0] != dominoes[0][1]:
        return None
    else:
        perms=list(permutations(dominoes,len(dominoes)))
        perms=list(filter(same_first_last, perms))
        perms=[flip_sort(list(x)) for x in perms]
        perms=list(filter(is_valid_chain,perms))
        if perms==[]:
            return None
        else:
            return perms[0][1]

