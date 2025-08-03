"""Functions to manage a users shopping cart items."""


def add_item(current_cart, items_to_add):  
    for item in items_to_add:
        if item in current_cart:
            current_cart[item]=current_cart[item]+1
        else:
            current_cart.setdefault(item,1)
    return current_cart


def read_notes(notes):
    new_cart=dict.fromkeys(notes,1)
    return new_cart


def update_recipes(ideas, recipe_updates):
    ideas.update(recipe_updates)
    return ideas


def sort_entries(cart):
    sorted_cart=dict(sorted(cart.items()))
    return sorted_cart

def send_to_store(cart, aisle_mapping):
    combined_cart=dict.fromkeys(cart.keys())
    for item in combined_cart:
        aisle_mapping[item].insert(0,cart[item])
        combined_cart[item]=aisle_mapping[item]
    combined_cart=dict(sorted(combined_cart.items(),reverse=True))
    return combined_cart
    
def update_store_inventory(fulfillment_cart, store_inventory):
    for item in fulfillment_cart:
        if store_inventory[item][0]-fulfillment_cart[item][0]==0:
            store_inventory[item][0]='Out of Stock'
        else:
            store_inventory[item][0]=store_inventory[item][0]-fulfillment_cart[item][0]
    return store_inventory
        
