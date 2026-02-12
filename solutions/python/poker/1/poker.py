hand_possible_values=[
    'Royal flush',
    'Straight flush',
    'Low straight flush',
    'Four of a kind',
    'Full house',
    'Flush',
    'Straight',
    'Low straight',
    'Three of a kind',
    'Two pairs',
    'One pair',
    'Highest card'
    ]

def sort_up(hand):
    hand_list=hand.split()
    temp1=''
    temp2=temp1
    for i in range(0,len(hand_list)):
        for j in range(i+1,len(hand_list)):
            temp1=hand_list[i]
            temp2=hand_list[j]
            if temp1[:-1]==temp2[:-1]:
                if ord(temp1[-1]) > ord(temp2[-1]):
                    hand_list[j]=temp1
                    hand_list[i]=temp2
            elif temp1[:-1]=='A':
                hand_list[j]=temp1
                hand_list[i]=temp2
            elif temp1[:-1]=='K':
                hand_list[j]=temp1
                hand_list[i]=temp2
            elif temp1[:-1]=='Q':    
                hand_list[j]=temp1
                hand_list[i]=temp2
            elif temp1[:-1]=='J':
                hand_list[j]=temp1
                hand_list[i]=temp2
            elif not temp2[:-1].isalpha() and int(temp1[:-1]) > int(temp2[:-1]):
                hand_list[j]=temp1
                hand_list[i]=temp2
    return ' '.join(hand_list)
            
def sort_down(hand):
    pass
    
def highest_card(hand):
    return hand.split()[-1]

def count_colors(hand):
  return [hand.count("C"),hand.count("D"),hand.count("H"),hand.count("S")]

def count_numbers(hand):
  numbers=[
      hand.count("2"),hand.count("3"),hand.count("4"),
      hand.count("5"),hand.count("6"),hand.count("7"),
      hand.count("8"),hand.count("9"),hand.count("0"),
      hand.count("J"),hand.count("Q"),hand.count("K"),hand.count("A"),
  ]
  return numbers

def is_flush(hand):
  return any(c==5 for c in count_colors(hand))

def is_straight(hand):
  numbers=''.join(str(num) for num in count_numbers(hand))
  return numbers.find("11111") >= 0

def is_straight_low(hand):
    numbers=''.join(str(num) for num in count_numbers(hand))
    return numbers == "1111000000001"

def is_straight_flush(hand):
  return is_flush(hand) and is_straight(hand)

def is_straight_flush_low(hand):
    return is_flush(hand) and is_straight_low(hand)

def hand_value(hand):
  cards=hand.split()
  colors=count_colors(hand)
  numbers=count_numbers(hand)
  value=""
  if is_straight_flush(hand) and count_numbers(hand)[-1]==1:
      value="Royal flush" 
  elif is_straight_flush(hand):
      value="Straight flush"
  elif is_straight_flush_low(hand):
      value="Low straight flush"
  elif any(x==4 for x in numbers) and all(c>=1 for c in colors):
      value="Four of a kind"  
  elif any(x==3 for x in numbers) and any(x==2 for x in numbers):
      value="Full house"
  elif is_straight(hand):
      value="Straight"
  elif is_straight_low(hand):
      value="Low straight"
  elif is_flush(hand):
      value="Flush"
  elif any(x==3 for x in numbers):
      value="Three of a kind"
  elif any(x==2 for x in numbers) and numbers.count(2)==2:
      value="Two pairs"
  elif any(x==2 for x in numbers) and numbers.count(2)==1:
      value="One pair"
  else:
      value="Highest card"
  
  return value

def tie_breaker(hand_list):
    if len(hand_list)==1:
        return hand_list
    else:
        #four of kind tie
        if (hand_value(hand_list[0])=='Four of a kind'):
            #check the value of the highest quad
            if count_numbers(hand_list[0]).index(4) > count_numbers(hand_list[1]).index(4):
                return [hand_list[0]]
            elif count_numbers(hand_list[0]).index(4) < count_numbers(hand_list[1]).index(4):
                return [hand_list[1]]
            elif count_numbers(hand_list[0]).index(1) > count_numbers(hand_list[1]).index(1):
                return [hand_list[0]]
            elif count_numbers(hand_list[0]).index(1) < count_numbers(hand_list[1]).index(1):
                return [hand_list[1]]
            else:
                return hand_list  
        #triplet tie
        elif (hand_value(hand_list[0])=='Full house'):
            if count_numbers(hand_list[0]).index(3) > count_numbers(hand_list[1]).index(3):
                return [hand_list[0]]
            elif count_numbers(hand_list[0]).index(3) < count_numbers(hand_list[1]).index(3):
                return [hand_list[1]]
            elif count_numbers(hand_list[0]).index(2) > count_numbers(hand_list[1]).index(2):
                return [hand_list[0]]
            elif count_numbers(hand_list[0]).index(2) < count_numbers(hand_list[1]).index(2):
                return [hand_list[1]]
            else:
                return hand_list 
        else:
            winner=[]
            winner_list=[]
            for hand in hand_list:
                num=count_numbers(hand)
                num.reverse()
                winner.append(int(''.join(str(n) for n in num)))
            for i in range(0,len(hand_list)):
                if winner[i]==max(winner):
                    winner_list.append(hand_list[i])
            return(winner_list)
    
def best_hands(hands):
    if len(hands)==1:
        return hands
    else:
        highest_card_list=[]
        hand_values=[]
        all_values=[]
        high_hand=[]
        for ph in hand_possible_values:
            hand_list=[]
            for hand in hands:
                if hand_value(hand)==ph:
                    hand_list.append(hand)
                hand_values.append(hand_value(hand))
                highest_card_list.append(highest_card(sort_up(hand)))
            all_values.append(hand_list)
        for v in all_values:
            if not v==[]:
                high_hand=v
                high_hand=tie_breaker(high_hand)
                break
        
        return high_hand
