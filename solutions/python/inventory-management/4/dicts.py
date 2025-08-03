"""Functions to keep track and alter inventory."""
from collections import Counter

def create_inventory(items):
    return Counter(items)

def add_items(inventory, items):
    for item in items:
        if item in inventory:
            inventory[item] += 1
        else:
            inventory[item] = 1
    return inventory

def decrement_items(inventory, items):
    for item in items:
        if item in inventory and inventory[item]>0:
            inventory[item] -= 1
    return inventory

def remove_item(inventory, item):
    if item in inventory:
        inventory.pop(item)
    return inventory

def list_inventory(inventory):
    list_inv = [(key, value) for key, value in inventory.items() if value>0]
    return list_inv
