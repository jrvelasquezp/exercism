def find_fewest_coins(coins, target):
    if target < 0:
        raise ValueError("target can't be negative")
    elif target==0:
        return []
    elif target < min(coins):
        raise ValueError("can't make target with given coins")
    else:
        # 1. Define an array to store the quantity of coins for the amount
        qty_coins=[]
        prev=[]
        
        qty_coins.append(0)
        prev.append(0)
        
        # 2. Calculate for the desired amount
        for i in range(1,target+1):
            min_coin=10*target
            min_prev=10*target
            for coin in coins:
                if i-coin>=0:
                    if min_coin > qty_coins[i-coin]+1:
                        min_coin=qty_coins[i-coin]+1
                        min_prev=coin
            qty_coins.append(min_coin)
            prev.append(min_prev)
        
        # 3. Return the list of coins used to get this amount
        # 3a. Take last element of list
        
        coin_list=[]
        if prev[-1]>target:
            raise ValueError("can't make target with given coins")
        else:
            while target>0:
                coin_list.append(prev[target])
                print(coin_list)
                target=target-prev[target]
            
        return coin_list
